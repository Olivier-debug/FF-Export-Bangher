// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/flutter_flow/custom_functions.dart';
import '/auth/supabase_auth/auth_util.dart';

Future<void> loadUserProfile(BuildContext context) async {
  try {
    final userId = currentUserUid;
    if (userId == null || userId.isEmpty) {
      print('Error: No logged-in user.');
      return;
    }

    print('Loading profile for userId: $userId');

    // Call Supabase RPC function
    final response = await Supabase.instance.client.rpc(
      'get_user_profile',
      params: {'p_user_id': userId},
    );

    if (response == null) {
      print('No profile found.');
      return;
    }

    print('User profile loaded successfully: $response');

    // Store in App State
    FFAppState().update(() {
      FFAppState().currentUserProfile = response;
    });
  } catch (e, stackTrace) {
    print('Error loading user profile: $e');
    print('Stack trace: $stackTrace');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
