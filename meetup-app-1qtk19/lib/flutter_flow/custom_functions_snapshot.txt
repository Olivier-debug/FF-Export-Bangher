
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int functionToCalculateAge(DateTime dateOfBirth) {
  // calculate age using current date and date of birth
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - dateOfBirth.year;
  if (currentDate.month < dateOfBirth.month ||
      (currentDate.month == dateOfBirth.month &&
          currentDate.day < dateOfBirth.day)) {
    age--;
  }
  return age.toInt();
}

String? convertLatLngToSupabase(LatLng location) {
  return 'POINT(${location.longitude} ${location.latitude})'; // Longitude first (PostGIS format)
}
