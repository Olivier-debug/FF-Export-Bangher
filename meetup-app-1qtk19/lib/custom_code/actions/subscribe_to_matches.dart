// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

/// Subscribes to the `matches` table to receive updates only for the authenticated user.
/// Sends the `user1_id` and `user2_id` back to FlutterFlow when a match involving the authenticated user is found.
Future<void> subscribeToMatches(String authUserId,
    Future Function(String user1Id, String user2Id) matchesCallback) async {
  final channel = Supabase.instance.client.channel('public:matches');

  // Listen for changes on the matches table and trigger the callback when necessary
  channel.onPostgresChanges(
    event: PostgresChangeEvent.all,
    schema: 'public',
    table: 'matches',
    callback: (payload) async {
      final newRecord = payload.newRecord;
      if (newRecord != null &&
          (newRecord['user1_id'] == authUserId ||
              newRecord['user2_id'] == authUserId)) {
        final String user1Id = newRecord['user1_id'];
        final String user2Id = newRecord['user2_id'];
        await matchesCallback(user1Id, user2Id);
      }
    },
  );

  // Subscribe to the channel
  await channel.subscribe();
}
