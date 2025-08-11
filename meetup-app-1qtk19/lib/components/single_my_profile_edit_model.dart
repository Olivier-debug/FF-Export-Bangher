import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'single_my_profile_edit_widget.dart' show SingleMyProfileEditWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleMyProfileEditModel
    extends FlutterFlowModel<SingleMyProfileEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for educationChoiceChips widget.
  FormFieldController<List<String>>? educationChoiceChipsValueController;
  String? get educationChoiceChipsValue =>
      educationChoiceChipsValueController?.value?.firstOrNull;
  set educationChoiceChipsValue(String? val) =>
      educationChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for familyChoiceChips widget.
  FormFieldController<List<String>>? familyChoiceChipsValueController;
  String? get familyChoiceChipsValue =>
      familyChoiceChipsValueController?.value?.firstOrNull;
  set familyChoiceChipsValue(String? val) =>
      familyChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for communicationChoiceChips widget.
  FormFieldController<List<String>>? communicationChoiceChipsValueController;
  String? get communicationChoiceChipsValue =>
      communicationChoiceChipsValueController?.value?.firstOrNull;
  set communicationChoiceChipsValue(String? val) =>
      communicationChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for loveStyleChoiceChips widget.
  FormFieldController<List<String>>? loveStyleChoiceChipsValueController;
  String? get loveStyleChoiceChipsValue =>
      loveStyleChoiceChipsValueController?.value?.firstOrNull;
  set loveStyleChoiceChipsValue(String? val) =>
      loveStyleChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for petChoiceChips widget.
  FormFieldController<List<String>>? petChoiceChipsValueController;
  String? get petChoiceChipsValue =>
      petChoiceChipsValueController?.value?.firstOrNull;
  set petChoiceChipsValue(String? val) =>
      petChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for drinkingChoiceChips widget.
  FormFieldController<List<String>>? drinkingChoiceChipsValueController;
  String? get drinkingChoiceChipsValue =>
      drinkingChoiceChipsValueController?.value?.firstOrNull;
  set drinkingChoiceChipsValue(String? val) =>
      drinkingChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for smokingChoiceChips widget.
  FormFieldController<List<String>>? smokingChoiceChipsValueController;
  String? get smokingChoiceChipsValue =>
      smokingChoiceChipsValueController?.value?.firstOrNull;
  set smokingChoiceChipsValue(String? val) =>
      smokingChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for workoutChoiceChips widget.
  FormFieldController<List<String>>? workoutChoiceChipsValueController;
  String? get workoutChoiceChipsValue =>
      workoutChoiceChipsValueController?.value?.firstOrNull;
  set workoutChoiceChipsValue(String? val) =>
      workoutChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for dietChoiceChips widget.
  FormFieldController<List<String>>? dietChoiceChipsValueController;
  String? get dietChoiceChipsValue =>
      dietChoiceChipsValueController?.value?.firstOrNull;
  set dietChoiceChipsValue(String? val) =>
      dietChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for socialMediaChoiceChips widget.
  FormFieldController<List<String>>? socialMediaChoiceChipsValueController;
  String? get socialMediaChoiceChipsValue =>
      socialMediaChoiceChipsValueController?.value?.firstOrNull;
  set socialMediaChoiceChipsValue(String? val) =>
      socialMediaChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for sleepingChoiceChips widget.
  FormFieldController<List<String>>? sleepingChoiceChipsValueController;
  String? get sleepingChoiceChipsValue =>
      sleepingChoiceChipsValueController?.value?.firstOrNull;
  set sleepingChoiceChipsValue(String? val) =>
      sleepingChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for religionChoiceChips widget.
  FormFieldController<List<String>>? religionChoiceChipsValueController;
  String? get religionChoiceChipsValue =>
      religionChoiceChipsValueController?.value?.firstOrNull;
  set religionChoiceChipsValue(String? val) =>
      religionChoiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
