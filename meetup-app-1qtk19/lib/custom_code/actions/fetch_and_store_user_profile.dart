// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow Imports
// Automatic FlutterFlow Imports

Future<void> fetchAndStoreUserProfile(String userId) async {
  if (userId.isEmpty) {
    print('❌ Error: No user ID provided.');
    return;
  }

  try {
    // 🔥 Query Supabase for user profile based on userId
    final response = await Supabase.instance.client
        .from('profiles')
        .select()
        .eq('user_id', userId)
        .limit(1)
        .maybeSingle();

    if (response == null) {
      print('❌ No user profile found.');
      return;
    }

    // ✅ Convert Supabase row to JSON
    final Map<String, dynamic> userData = {
      "id": response["id"],
      "created_at": response["created_at"],
      "user_id": response["user_id"],
      "gender": response["gender"],
      "profile_pictures": response["profile_pictures"],
      "name": response["name"],
      "location": response["location"],
      "location2": response["location2"],
      "age": response["age"],
      "bio": response["bio"],
      "last_seen": response["last_seen"],
      "is_online": response["is_online"],
      "interests": response["interests"], // List<String>
      "my_languages": response["my_languages"], // Nullable
      "job_title": response["job_title"],
      "height": response["height"],
      "weight": response["weight"],
      "company": response["company"],
      "family_plans": response["family_plans"],
      "education": response["education"],
      "love_language": response["love_language"],
      "pets": response["pets"],
      "drinking": response["drinking"],
      "smoking": response["smoking"],
      "exercise": response["exercise"],
      "current_city": response["current_city"],
      "relationship_goals": response["relationship_goals"],
      "date_of_birth": response["date_of_birth"],
      "diet_preference": response["diet_preference"],
      "social_media": response["social_media"],
      "sleeping_habits": response["sleeping_habits"],
      "communication_style": response["communication_style"],
      "image1": response["image1"],
      "school": response["school"],
      "religion": response["religion"]
    };

    // 🔥 Store data in App State
    FFAppState().update(() {
      FFAppState().authUserDetails = userData;
    });

    print('✅ User profile stored in App State: $userData');
  } catch (error) {
    print('❌ Error fetching user profile: $error');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
