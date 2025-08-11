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

Future<void> onlineUsers(BuildContext context, String userID) async {
  final channel = Supabase.instance.client.channel(
    'Online',
    opts: const RealtimeChannelConfig(self: true),
  );

  // Track online presence with sync, join, and leave events
  channel.onPresenceSync((payload) {
    print('Synced presence state: ${channel.presenceState()}');

    // Update the profiles table for the current user to mark as online
    Supabase.instance.client.from('profiles').update({
      'is_online': true,
      'last_seen': DateTime.now().toUtc().toIso8601String(), // Ensure UTC
    }).eq('user_id', userID);
  });

  // Handle new join events
  channel.onPresenceJoin((payload) {
    print('Newly joined presences: $payload');
  });

  // Handle leave events
  channel.onPresenceLeave((payload) {
    print('Newly left presences: $payload');
  });

  // Subscribe to the channel and track the authenticated user's online status
  await channel.subscribe((status, error) async {
    if (status == RealtimeSubscribeStatus.subscribed) {
      await channel.track({
        'user_id': userID,
        'online_at': DateTime.now().toUtc().toIso8601String(), // Ensure UTC
      });
    }
  });
}
