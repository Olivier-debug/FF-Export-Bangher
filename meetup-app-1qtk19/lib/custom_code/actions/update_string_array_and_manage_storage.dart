// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:core';

Future<bool> updateStringArrayAndManageStorage(
  String userId, // ✅ User ID (UUID)
  String newValue, // ✅ The new image URL to save
  int indexToReplace, // ✅ Index where the image should be stored
  String columnName, // ✅ Name of the array column in Supabase
) async {
  if (userId.isEmpty ||
      newValue.isEmpty ||
      columnName.isEmpty ||
      indexToReplace < 0) {
    print("❌ Error: Missing or invalid parameters.");
    return false;
  }

  try {
    final supabase = Supabase.instance.client;

    // ✅ Fetch the existing array from Supabase
    final response = await supabase
        .from('profiles')
        .select(columnName)
        .eq('user_id', userId)
        .single();

    List<String> items = [];

    if (response != null && response[columnName] != null) {
      items = List<String>.from(response[columnName]);
    }

    String? oldImageUrl;

    // ✅ Expand the array if it’s empty or too small
    while (items.length <= indexToReplace) {
      items.add(''); // Fill empty slots with empty strings
    }

    // ✅ Store the old image URL before replacing
    if (indexToReplace >= 0 && indexToReplace < items.length) {
      oldImageUrl = items[indexToReplace];
    }

    // ✅ Replace the image at the given index
    items[indexToReplace] = newValue;

    // ✅ Update Supabase with the modified array
    await supabase.from('profiles').update({
      columnName: items,
    }).eq('user_id', userId);

    // ✅ Delete the old image from storage (if it exists and is different)
    if (oldImageUrl != null &&
        oldImageUrl.isNotEmpty &&
        oldImageUrl != newValue) {
      await _deleteImageFromStorage(oldImageUrl);
    }

    // ✅ Update FlutterFlow app state
    // Note: In FlutterFlow, FFAppState() is a global accessor to the app state
    while (FFAppState().profilePictures.length <= indexToReplace) {
      FFAppState().profilePictures.add('');
    }
    FFAppState().profilePictures[indexToReplace] = newValue;
    // Trigger a state update to notify listeners (FlutterFlow handles this internally)
    FFAppState().update(() {});

    print("✅ Successfully updated the array at index $indexToReplace!");
    return true;
  } catch (e) {
    print("❌ Supabase update failed: $e");
    return false;
  }
}

/// ✅ Helper Function: Deletes an Image from Supabase Storage
Future<void> _deleteImageFromStorage(String imageUrl) async {
  try {
    final supabase = Supabase.instance.client;

    // ✅ Extract the correct object path from the URL
    const String baseUrl =
        "https://ccaxkmbpnvuuhxgtjjnv.supabase.co/storage/v1/object/public/";

    if (!imageUrl.startsWith(baseUrl)) {
      print("⚠️ Error: The image URL does not belong to Supabase storage.");
      return;
    }

    // ✅ Remove the base URL to get the correct storage path
    String storagePath = imageUrl.replaceFirst(baseUrl, "");

    // ✅ Extract the bucket name and object path
    List<String> pathSegments = storagePath.split('/');

    if (pathSegments.length < 2) {
      print(
          "❌ Error: Could not extract valid storage path from URL: $imageUrl");
      return;
    }

    String bucketName = pathSegments.first; // "user_pictures"
    String objectPath =
        pathSegments.sublist(1).join('/'); // "user_id/filename.jpg"

    print("🗑 Attempting to delete: Bucket = $bucketName, Path = $objectPath");

    // ✅ Delete the file from Supabase Storage
    final List<dynamic> response =
        await supabase.storage.from(bucketName).remove([objectPath]);

    if (response.isEmpty) {
      print("✅ Successfully deleted old image from storage.");
    } else {
      print("⚠️ Image may not have been deleted. Response: $response");
    }
  } catch (e) {
    print("❌ Failed to delete image from storage: $e");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
