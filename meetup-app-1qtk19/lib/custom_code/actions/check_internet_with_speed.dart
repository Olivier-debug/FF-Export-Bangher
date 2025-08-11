// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';
import 'dart:async';

Future<bool> checkInternetWithSpeed() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    return false; // No connection at all
  }

  try {
    final stopwatch = Stopwatch()..start();

    // Try to reach Google's DNS server (works on mobile & web)
    final result = await InternetAddress.lookup('8.8.8.8');

    stopwatch.stop();

    if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
      int ping = stopwatch.elapsedMilliseconds;
      print("Internet speed (ping): $ping ms");
      return true; // Internet is working
    }
  } catch (e) {
    return false; // No real internet
  }

  return false;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
