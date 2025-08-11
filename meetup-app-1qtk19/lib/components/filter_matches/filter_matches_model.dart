import '/components/education_bottom_sheet/education_bottom_sheet_widget.dart';
import '/components/interest_bottom_sheet/interest_bottom_sheet_widget.dart';
import '/components/language_filter_bottom_sheet/language_filter_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'filter_matches_widget.dart' show FilterMatchesWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterMatchesModel extends FlutterFlowModel<FilterMatchesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GenderOptionsChoiceChips widget.
  FormFieldController<List<String>>? genderOptionsChoiceChipsValueController;
  String? get genderOptionsChoiceChipsValue =>
      genderOptionsChoiceChipsValueController?.value?.firstOrNull;
  set genderOptionsChoiceChipsValue(String? val) =>
      genderOptionsChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for distanceSlider widget.
  double? distanceSliderValue;
  // State field(s) for ageSlider widget.
  double? ageSliderValue;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
