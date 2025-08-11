import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/image_cropper_bottom_sheet_widget.dart';
import '/components/list_my_profile_edit_widget.dart';
import '/components/single_my_profile_edit_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_selectedImage = false;
  FFUploadedFile uploadedLocalFile_selectedImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Bottom Sheet - ImageCropperBottomSheet] action in Container widget.
  String? croppedImage;
  bool isDataUploading_selectedImage2 = false;
  FFUploadedFile uploadedLocalFile_selectedImage2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Bottom Sheet - ImageCropperBottomSheet] action in Container widget.
  String? croppedImage2;
  bool isDataUploading_selectedImage3 = false;
  FFUploadedFile uploadedLocalFile_selectedImage3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Bottom Sheet - ImageCropperBottomSheet] action in Container widget.
  String? croppedImage3;
  bool isDataUploading_selectedImage4 = false;
  FFUploadedFile uploadedLocalFile_selectedImage4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Bottom Sheet - ImageCropperBottomSheet] action in Container widget.
  String? croppedImage4;
  bool isDataUploading_selectedImage5 = false;
  FFUploadedFile uploadedLocalFile_selectedImage5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Bottom Sheet - ImageCropperBottomSheet] action in Container widget.
  String? croppedImage5;
  bool isDataUploading_selectedImage6 = false;
  FFUploadedFile uploadedLocalFile_selectedImage6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Bottom Sheet - ImageCropperBottomSheet] action in Container widget.
  String? croppedImage6;
  // State field(s) for nickNameTextField widget.
  FocusNode? nickNameTextFieldFocusNode;
  TextEditingController? nickNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      nickNameTextFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for genderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for jobTitleTextField widget.
  FocusNode? jobTitleTextFieldFocusNode;
  TextEditingController? jobTitleTextFieldTextController;
  String? Function(BuildContext, String?)?
      jobTitleTextFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for livingInTextField widget.
  FocusNode? livingInTextFieldFocusNode;
  TextEditingController? livingInTextFieldTextController;
  String? Function(BuildContext, String?)?
      livingInTextFieldTextControllerValidator;
  // State field(s) for bioTextField widget.
  FocusNode? bioTextFieldFocusNode;
  TextEditingController? bioTextFieldTextController;
  String? Function(BuildContext, String?)? bioTextFieldTextControllerValidator;
  // Stores action output result for [Bottom Sheet - listMyProfileEdit] action in Row widget.
  List<String>? interestsSelected;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // Stores action output result for [Bottom Sheet - listMyProfileEdit] action in Row widget.
  List<String>? relationshipSelected;
  // Stores action output result for [Bottom Sheet - listMyProfileEdit] action in Row widget.
  List<String>? selectedLanguages;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? religionselected;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? educationselected;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? familyselected;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? communicationStyle;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? loveStyleSelected;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? petselected;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? drinkingSelection;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? smokingSelection;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? workoutSelection;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? dietSelection;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? socialMediaSelection;
  // Stores action output result for [Bottom Sheet - singleMyProfileEdit] action in Row widget.
  String? sleepingSelection;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nickNameTextFieldFocusNode?.dispose();
    nickNameTextFieldTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    jobTitleTextFieldFocusNode?.dispose();
    jobTitleTextFieldTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController6?.dispose();

    textFieldFocusNode5?.dispose();
    textController7?.dispose();

    livingInTextFieldFocusNode?.dispose();
    livingInTextFieldTextController?.dispose();

    bioTextFieldFocusNode?.dispose();
    bioTextFieldTextController?.dispose();

    textFieldFocusNode6?.dispose();
    textController10?.dispose();

    textFieldFocusNode7?.dispose();
    textController11?.dispose();

    textFieldFocusNode8?.dispose();
    textController12?.dispose();

    textFieldFocusNode9?.dispose();
    textController13?.dispose();
  }
}
