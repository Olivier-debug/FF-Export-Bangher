// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

Future<void> updateUserProfileField(String field, String value) async {
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

  // ✅ Convert value if it's supposed to be a number or boolean
  dynamic newValue;
  if (value == "true" || value == "false") {
    newValue = value == "true"; // Convert "true"/"false" to boolean
  } else if (RegExp(r'^-?[0-9]+$').hasMatch(value)) {
    newValue = int.tryParse(value); // Convert to int if it looks like a number
  } else if (RegExp(r'^-?[0-9]+\.[0-9]+$').hasMatch(value)) {
    newValue = double.tryParse(value); // Convert to double if decimal
  } else if (value.startsWith("{") && value.endsWith("}")) {
    try {
      newValue = jsonDecode(value); // Convert JSON string to object
    } catch (e) {
      print("❌ Error decoding JSON: $e");
      newValue = value; // Fallback to string
    }
  } else {
    newValue = value; // Default to string
  }

  // ✅ Update only the specified field in JSON
  updatedProfile[field] = newValue;

  // ✅ Save back to App State
  FFAppState().update(() {
    FFAppState().authUserDetails = updatedProfile;
  });

  print("✅ Successfully updated: $field = $newValue");
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
