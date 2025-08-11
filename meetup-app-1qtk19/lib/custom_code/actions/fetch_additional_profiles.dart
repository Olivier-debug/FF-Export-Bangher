// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> fetchAdditionalProfiles(BuildContext context, String userId,
    String gender, double radius, int ageMin, int ageMax, int limit) async {
  // Validate parameters
  if (radius <= 0 || ageMin < 0 || ageMax < ageMin || limit <= 0) {
    print('Invalid parameters for fetching profiles.');
    return;
  }

  try {
    // Retrieve current app state variables
    final currentProfiles = FFAppState().potentialMatches ?? [];
    final swipeHistory = FFAppState().swipeHistory ?? [];

    // Access profileBuffer without updating app state
    List<dynamic> profileBuffer = FFAppState().profileBuffer ?? [];

    // Step 1: Fetch profiles into buffer if potentialMatches <= 3
    if (currentProfiles.length <= 3 && profileBuffer.isEmpty) {
      print('Fetching profiles into profileBuffer...');

      // Fetch profiles from Supabase
      final response = await Supabase.instance.client.rpc(
        'get_potential_matches',
        params: {
          'user_id_arg': userId,
          'gender_arg': gender,
          'radius_arg': radius,
          'age_min_arg': ageMin,
          'age_max_arg': ageMax,
          'limit_arg': limit,
        },
      ).select();

      if (response == null || response.isEmpty) {
        print('No new profiles fetched.');
        return; // Exit early if no profiles are fetched
      }

      // Collect all existing profile IDs for deduplication
      final existingIds = <String>{
        ...currentProfiles.map((p) => p['potential_match_id']),
        ...profileBuffer.map((p) => p['potential_match_id']),
        ...swipeHistory.map((p) => p['potential_match_id']),
      };

      // Filter and add new unique profiles to profileBuffer
      final newProfiles = response
          .where((profile) =>
              profile.containsKey('potential_match_id') &&
              !existingIds.contains(profile['potential_match_id']))
          .toList();

      // Append profiles to profileBuffer without updating app state
      profileBuffer.addAll(newProfiles);

      print('Profiles added to profileBuffer: ${newProfiles.length}');
      print('Total profiles in profileBuffer: ${profileBuffer.length}');
    }

    // Step 2: Transfer profiles from the buffer to potentialMatches if necessary
    if (currentProfiles.length <= 1 && profileBuffer.isNotEmpty) {
      print('Transferring profiles from profileBuffer to potentialMatches...');

      final profilesToAdd = List.from(profileBuffer);

      // Clear profileBuffer directly (not updating app state)
      profileBuffer.clear();

      // Add profiles to potentialMatches and update the app state
      FFAppState().update(() {
        FFAppState().potentialMatches = [...currentProfiles, ...profilesToAdd];
      });

      print(
          'Transferred profiles. potentialMatches: ${FFAppState().potentialMatches.length}, profileBuffer cleared.');
    }

    // Step 3: Refresh the swipe stack if potentialMatches has 1 or fewer profiles
    if (currentProfiles.length <= 1) {
      print('Refreshing the swipe stack...');
      FFAppState().update(() {
        FFAppState().isSwipeStackVisible = false; // Temporarily hide the stack
      });

      await Future.delayed(const Duration(milliseconds: 10));

      // Re-show the swipe stack instantly
      FFAppState().update(() {
        FFAppState().isSwipeStackVisible = true;
      });
    }
  } catch (e, stackTrace) {
    // Handle and log errors
    print('Error in fetchAdditionalProfiles: $e');
    print('Stack trace: $stackTrace');
  }
}
