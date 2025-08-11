// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:collection/collection.dart'; // Corrected Import

Future<void> handleSwipeActionCombined(
  dynamic swipedUser,
  String swiperId,
  String swipeeId,
  bool liked,
) async {
  try {
    // Step 1: Validate Input Early (Immediate return if invalid)
    if (swipedUser == null || swiperId.isEmpty || swipeeId.isEmpty) {
      throw ArgumentError(
          'Invalid parameters passed to handleSwipeActionCombined.');
    }

    // Step 2: Retrieve Current State
    final currentSwipeHistory = FFAppState().swipeHistory ?? [];
    final currentPotentialMatches = FFAppState().potentialMatches ?? [];

    // Step 3: Prepare Updated State
    final updatedSwipeHistory = [
      swipedUser,
      ...currentSwipeHistory.take(2)
    ]; // Keep only last 2 swipes
    final updatedPotentialMatches =
        currentPotentialMatches.where((match) => match != swipedUser).toList();

    // Step 4: Compare before updating
    bool hasStateChanged = false;

    // Check for swipe history changes
    if (!const ListEquality()
        .equals(currentSwipeHistory, updatedSwipeHistory)) {
      FFAppState().swipeHistory = updatedSwipeHistory;
      hasStateChanged = true;
    }

    // Check for potential matches changes
    if (!const ListEquality()
        .equals(currentPotentialMatches, updatedPotentialMatches)) {
      FFAppState().potentialMatches = updatedPotentialMatches;
      hasStateChanged = true;
    }

    if (!hasStateChanged) {
      print('No changes to local state, skipping update.');
      return; // Exit early if state hasn't changed
    } else {
      print('Local swipe action state updated successfully.');
    }

    // Step 5: Record Swipe Action in Database via Supabase RPC
    final response = await Supabase.instance.client.rpc(
      'handle_swipe',
      params: {
        'swiper_id_arg': swiperId,
        'swipee_id_arg': swipeeId,
        'liked_arg': liked,
      },
    );

    if (response == null) {
      print('No data returned from handle_swipe RPC function.');
      return;
    }

    print('Swipe action recorded successfully in Supabase.');
  } catch (e, stackTrace) {
    // Step 6: Handle and Log Errors
    print('Error in handleSwipeActionCombined: $e');
    print('Stack trace: $stackTrace');
  }
}
