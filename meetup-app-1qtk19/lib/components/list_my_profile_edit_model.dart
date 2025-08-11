import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'list_my_profile_edit_widget.dart' show ListMyProfileEditWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListMyProfileEditModel extends FlutterFlowModel<ListMyProfileEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for interestChoiceChips widget.
  FormFieldController<List<String>>? interestChoiceChipsValueController;
  List<String>? get interestChoiceChipsValues =>
      interestChoiceChipsValueController?.value;
  set interestChoiceChipsValues(List<String>? val) =>
      interestChoiceChipsValueController?.value = val;
  // State field(s) for datingCheckBox widget.
  bool? datingCheckBoxValue;
  // State field(s) for friendshipCheckBox widget.
  bool? friendshipCheckBoxValue;
  // State field(s) for casualCheckBox widget.
  bool? casualCheckBoxValue;
  // State field(s) for seriousCheckBox widget.
  bool? seriousCheckBoxValue;
  // State field(s) for myLanguages widget.
  FormFieldController<List<String>>? myLanguagesValueController;
  List<String>? get myLanguagesValues => myLanguagesValueController?.value;
  set myLanguagesValues(List<String>? v) =>
      myLanguagesValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
