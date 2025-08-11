import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_cropper_bottom_sheet_model.dart';
export 'image_cropper_bottom_sheet_model.dart';

class ImageCropperBottomSheetWidget extends StatefulWidget {
  const ImageCropperBottomSheetWidget({
    super.key,
    required this.uploadedImage,
  });

  final FFUploadedFile? uploadedImage;

  @override
  State<ImageCropperBottomSheetWidget> createState() =>
      _ImageCropperBottomSheetWidgetState();
}

class _ImageCropperBottomSheetWidgetState
    extends State<ImageCropperBottomSheetWidget> {
  late ImageCropperBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageCropperBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: MediaQuery.sizeOf(context).height * 0.8,
          child: custom_widgets.ImageCropper(
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: MediaQuery.sizeOf(context).height * 0.8,
            currentUserId: currentUserUid,
            imageFile: widget!.uploadedImage,
            callBackAction: (url) async {
              Navigator.pop(context, url);
            },
          ),
        ),
      ),
    );
  }
}
