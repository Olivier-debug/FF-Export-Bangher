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

/// Subscribes to the `messages` table to receive updates only for the authenticated user.
Future<void> subscribeToMessages(
    String authUserId, Future Function() messagesCallback) async {
  final channel = Supabase.instance.client.channel('public:messages');

  // Subscribe to Postgres changes on the `messages` table
  channel.onPostgresChanges(
    event: PostgresChangeEvent.all,
    schema: 'public',
    table: 'messages',
    callback: (PostgresChangePayload payload) async {
      // Check if the sender_id in the payload matches the authenticated user
      final newRecord = payload.newRecord;
      if (newRecord != null && newRecord['sender_id'] == authUserId) {
        await messagesCallback();
      }
    },
  );

  // Subscribe to the channel
  channel.subscribe();
}
