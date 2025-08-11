import '/components/swiper_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'single_page_widget.dart' show SinglePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SinglePageModel extends FlutterFlowModel<SinglePageWidget> {
  ///  State fields for stateful widgets in this page.

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
