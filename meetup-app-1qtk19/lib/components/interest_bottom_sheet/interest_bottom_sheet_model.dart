import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'interest_bottom_sheet_widget.dart' show InterestBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InterestBottomSheetModel
    extends FlutterFlowModel<InterestBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for interestChoiceChips widget.
  FormFieldController<List<String>>? interestChoiceChipsValueController;
  List<String>? get interestChoiceChipsValues =>
      interestChoiceChipsValueController?.value;
  set interestChoiceChipsValues(List<String>? val) =>
      interestChoiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
