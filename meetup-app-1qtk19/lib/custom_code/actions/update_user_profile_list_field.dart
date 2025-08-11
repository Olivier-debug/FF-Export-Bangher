// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateUserProfileListField(
    String field, List<String> values) async {
  // ✅ Ensure authUserDetails is initialized
  if (FFAppState().authUserDetails == null ||
      FFAppState().authUserDetails.isEmpty) {
    FFAppState().update(() {
      FFAppState().authUserDetails = {}; // Initialize as empty JSON
    });
  }

  // ✅ Clone the existing JSON object
  final Map<String, dynamic> updatedProfile =
      Map<String, dynamic>.from(FFAppState().authUserDetails);

  // ✅ Update the specified field with the list
  updatedProfile[field] = values; // Directly assign the list

  // ✅ Save back to App State
  FFAppState().update(() {
    FFAppState().authUserDetails = updatedProfile;
  });

  print("✅ Successfully updated list field: $field = $values");
}

// ✅ Save back to App State (assuming
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
