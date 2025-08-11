import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'education_bottom_sheet_widget.dart' show EducationBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EducationBottomSheetModel
    extends FlutterFlowModel<EducationBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for educationChoiceChips widget.
  FormFieldController<List<String>>? educationChoiceChipsValueController;
  String? get educationChoiceChipsValue =>
      educationChoiceChipsValueController?.value?.firstOrNull;
  set educationChoiceChipsValue(String? val) =>
      educationChoiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
