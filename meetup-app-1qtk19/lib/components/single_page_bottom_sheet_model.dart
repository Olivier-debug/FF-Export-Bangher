import '/components/swiper_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'single_page_bottom_sheet_widget.dart' show SinglePageBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SinglePageBottomSheetModel
    extends FlutterFlowModel<SinglePageBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkInternetWithSpeed] action in singlePageBottomSheet widget.
  bool? internetConnected;
  // Model for swiper component.
  late SwiperModel swiperModel;

  @override
  void initState(BuildContext context) {
    swiperModel = createModel(context, () => SwiperModel());
  }

  @override
  void dispose() {
    swiperModel.dispose();
  }
}
