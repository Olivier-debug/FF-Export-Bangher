// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> loadInitialProfiles(BuildContext context, String userId,
    String gender, double radius, int ageMin, int ageMax, int limit) async {
  // Validate parameters
  if (radius <= 0 || ageMin < 0 || ageMax < ageMin || limit <= 0) {
    print('Invalid parameters for loading profiles.');
    return;
  }

  try {
    // Fetch initial profiles from backend
    print('Loading initial profiles...');
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

    // Log the response
    print('Supabase response: $response');

    if (response == null || response.isEmpty) {
      print('No profiles loaded.');
      return; // Exit early if no profiles are fetched
    }

    // Deduplicate profiles
    final Map<String, dynamic> uniqueProfiles = {
      for (var profile in response) profile['potential_match_id']: profile,
    };

    // Update app state with initial profiles
    FFAppState().update(() {
      FFAppState().potentialMatches = uniqueProfiles.values.toList();
    });

    print(
        'Loaded initial profiles: ${FFAppState().potentialMatches.length} profiles stored.');
  } catch (e, stackTrace) {
    print('Error in loadInitialProfiles: $e');
    print('Stack trace: $stackTrace');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
