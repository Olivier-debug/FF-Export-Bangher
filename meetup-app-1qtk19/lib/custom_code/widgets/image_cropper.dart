// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
// External package imports
import 'package:crop_your_image/crop_your_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';

class ImageCropper extends StatefulWidget {
  const ImageCropper({
    super.key,
    this.width,
    this.height,
    this.imageFile,
    this.callBackAction,
    this.currentUserId,
  });

  final double? width;
  final double? height;
  final FFUploadedFile? imageFile;
  final Future Function(String? url)? callBackAction;
  final String? currentUserId;

  @override
  State<ImageCropper> createState() => _ImageCropperState();
}

class _ImageCropperState extends State<ImageCropper> {
  final CropController _cropController = CropController();
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final bool hasImage = widget.imageFile?.bytes != null;
    final double cropHeight = (widget.height ?? 555) - 80;

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: widget.width ?? double.infinity,
              height: cropHeight,
              alignment: Alignment.center,
              child: hasImage
                  ? Crop(
                      image: Uint8List.fromList(widget.imageFile!.bytes!),
                      controller: _cropController,
                      onCropped: _onCropped,
                      aspectRatio: 9 /
                          16, // Change this if you want a different crop size
                      fixCropRect: true, // 🔥 Ensures crop box is fixed
                      interactive:
                          true, // 🔥 Allows only image movement, not crop box movement
                      initialSize:
                          1.0, // 🔥 Increased to make image fill more space
                      baseColor: Colors.black,
                      maskColor: Colors.white.withAlpha(100),
                      withCircleUi: false,
                      radius: 20,
                    )
                  : const Text("No image selected"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ValueListenableBuilder<bool>(
                valueListenable: _loading,
                builder: (context, isLoading, _) {
                  return _buildButton(
                    "Crop",
                    _startCropping,
                    FlutterFlowTheme.of(context).primaryColor,
                    hasImage && !isLoading,
                    isLoading: isLoading,
                  );
                },
              ),
            ),
          ],
        ),
        // Full-screen loading overlay
        ValueListenableBuilder<bool>(
          valueListenable: _loading,
          builder: (context, isLoading, _) {
            return isLoading
                ? Container(
                    color: Colors.black.withOpacity(0.6),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        Positioned(
          top: 4,
          right: 4,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              if (mounted && Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildButton(
      String text, VoidCallback? onPressed, Color color, bool enabled,
      {bool isLoading = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: SizedBox(
          width: 120,
          height: 45,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    text,
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _startCropping() {
    if (!_loading.value) {
      _loading.value = true;
      Future.microtask(_cropController.crop);
    }
  }

  Future<void> _onCropped(Uint8List image) async {
    if (widget.imageFile?.name == null || widget.currentUserId == null) {
      debugPrint("Error: Missing fileName or userId.");
      _loading.value = false;
      return;
    }

    final String path = '${widget.currentUserId}/${widget.imageFile!.name}';
    _uploadToSupabase(path, image);
  }

  void _uploadToSupabase(String path, Uint8List fileBytes) {
    Supabase.instance.client.storage
        .from('user_pictures')
        .uploadBinary(
          path,
          fileBytes,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
        )
        .then((_) {
      final String publicUrl = Supabase.instance.client.storage
          .from('user_pictures')
          .getPublicUrl(path);

      if (widget.callBackAction != null) {
        widget.callBackAction!(publicUrl);
      }
    }).catchError((e) {
      debugPrint('Upload error: $e');
    }).whenComplete(() {
      if (mounted) _loading.value = false;
    });
  }

  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }
}
