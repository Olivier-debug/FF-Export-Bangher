import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_home_list/empty_home_list_widget.dart';
import '/components/filter_matches/filter_matches_widget.dart';
import '/components/finding_nearby_matches_widget.dart';
import '/components/match_component/match_component_widget.dart';
import '/components/single_page_bottom_sheet_widget.dart';
import '/components/swiper_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isOnline = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<ProfilesRow>? currentUserDetails;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<PreferencesRow>? preferences;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Models for swiper dynamic component.
  late FlutterFlowDynamicModels<SwiperModel> swiperModels;
  // Model for emptyHomeList component.
  late EmptyHomeListModel emptyHomeListModel;
  // Model for findingNearbyMatches component.
  late FindingNearbyMatchesModel findingNearbyMatchesModel;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    swiperModels = FlutterFlowDynamicModels(() => SwiperModel());
    emptyHomeListModel = createModel(context, () => EmptyHomeListModel());
    findingNearbyMatchesModel =
        createModel(context, () => FindingNearbyMatchesModel());
  }

  @override
  void dispose() {
    swiperModels.dispose();
    emptyHomeListModel.dispose();
    findingNearbyMatchesModel.dispose();
  }
}
