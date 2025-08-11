// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> undoLastSwipeCombined(BuildContext context, String userId) async {
  // Validate user ID
  if (userId.isEmpty) {
    _showErrorMessage(context, 'Invalid user ID.');
    return;
  }

  try {
    // Step 1: Update local app state (swipe history and potential matches)
    List<dynamic> swipeHistory = FFAppState().swipeHistory ?? [];
    if (swipeHistory.isEmpty) {
      _showErrorMessage(context, 'No more users to undo locally.');
      return;
    }

    // Remove the most recent swipe from history
    final undoneUser = swipeHistory.removeAt(0);
    FFAppState().update(() {
      FFAppState().swipeHistory = swipeHistory;
      FFAppState().potentialMatches = [
        undoneUser,
        ...?FFAppState().potentialMatches,
      ];
    });

    // Temporarily hide the stack to force a rebuild
    print('Refreshing the swipe stack...');
    FFAppState().update(() {
      FFAppState().isSwipeStackVisible = false; // Hide the stack
    });

    // Delay briefly to allow UI to refresh
    await Future.delayed(const Duration(milliseconds: 50));

    // Re-show the swipe stack
    FFAppState().update(() {
      FFAppState().isSwipeStackVisible = true; // Show the stack
    });

    print('Undo successful locally. User added back to potential matches.');

    // Step 2: Call the Supabase RPC function to undo the swipe
    print('Updating backend to undo the swipe...');
    final response = await Supabase.instance.client
        .rpc('undo_last_swipe', params: {'user_id_arg': userId});

    if (response == null || response.isEmpty) {
      _showErrorMessage(context, 'No swipe to undo on the server.');
      return;
    }

    print('Undo successful in Supabase.');
  } catch (e, stackTrace) {
    print('Error in undoLastSwipeCombined: $e');
    print('Stack trace: $stackTrace');

    _showErrorMessage(context, 'Failed to undo swipe. Please try again.');
  }
}

// Helper method to show error messages in a snack bar
void _showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}
