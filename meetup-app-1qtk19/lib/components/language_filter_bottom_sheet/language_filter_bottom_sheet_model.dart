import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'language_filter_bottom_sheet_widget.dart'
    show LanguageFilterBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LanguageFilterBottomSheetModel
    extends FlutterFlowModel<LanguageFilterBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for languageChoiceChips widget.
  FormFieldController<List<String>>? languageChoiceChipsValueController;
  List<String>? get languageChoiceChipsValues =>
      languageChoiceChipsValueController?.value;
  set languageChoiceChipsValues(List<String>? val) =>
      languageChoiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
