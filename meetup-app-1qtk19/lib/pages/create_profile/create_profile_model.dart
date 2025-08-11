import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/location_permission_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late MaskTextInputFormatter textFieldMask2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  late MaskTextInputFormatter textFieldMask4;
  String? Function(BuildContext, String?)? textController4Validator;
  DateTime? datePicked;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for myLanguages widget.
  FormFieldController<List<String>>? myLanguagesValueController;
  List<String>? get myLanguagesValues => myLanguagesValueController?.value;
  set myLanguagesValues(List<String>? v) =>
      myLanguagesValueController?.value = v;

  // State field(s) for matchLanguages widget.
  FormFieldController<List<String>>? matchLanguagesValueController;
  List<String>? get matchLanguagesValues =>
      matchLanguagesValueController?.value;
  set matchLanguagesValues(List<String>? v) =>
      matchLanguagesValueController?.value = v;

  // State field(s) for ageMin widget.
  int? ageMinValue1;
  FormFieldController<int>? ageMinValueController1;
  // State field(s) for ageMin widget.
  int? ageMinValue2;
  FormFieldController<int>? ageMinValueController2;
  // State field(s) for datingCheckBox widget.
  bool? datingCheckBoxValue;
  // State field(s) for friendshipCheckBox widget.
  bool? friendshipCheckBoxValue;
  // State field(s) for casualCheckBox widget.
  bool? casualCheckBoxValue;
  // State field(s) for seriousCheckBox widget.
  bool? seriousCheckBoxValue;
  // State field(s) for interestChoiceChips widget.
  FormFieldController<List<String>>? interestChoiceChipsValueController;
  List<String>? get interestChoiceChipsValues =>
      interestChoiceChipsValueController?.value;
  set interestChoiceChipsValues(List<String>? val) =>
      interestChoiceChipsValueController?.value = val;
  bool isDataUploading_uploadDataSsp = false;
  FFUploadedFile uploadedLocalFile_uploadDataSsp =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataSsp = '';

  bool isDataUploading_uploadDataZ9q = false;
  FFUploadedFile uploadedLocalFile_uploadDataZ9q =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZ9q = '';

  bool isDataUploading_uploadDataVvt = false;
  FFUploadedFile uploadedLocalFile_uploadDataVvt =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataVvt = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
