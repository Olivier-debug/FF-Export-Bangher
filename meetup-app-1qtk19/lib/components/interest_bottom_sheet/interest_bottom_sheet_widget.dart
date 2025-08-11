import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interest_bottom_sheet_model.dart';
export 'interest_bottom_sheet_model.dart';

class InterestBottomSheetWidget extends StatefulWidget {
  const InterestBottomSheetWidget({super.key});

  @override
  State<InterestBottomSheetWidget> createState() =>
      _InterestBottomSheetWidgetState();
}

class _InterestBottomSheetWidgetState extends State<InterestBottomSheetWidget> {
  late InterestBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.85,
      decoration: BoxDecoration(
        color: Color(0xFF080808),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: FaIcon(
                        FontAwesomeIcons.angleDoubleDown,
                        color: Color(0xFF7D7E7F),
                        size: 21.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Text(
                        'Interests:',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .headlineMediumIsCustom,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('Rugby'),
                                    ChipData('Soccer'),
                                    ChipData('Braai'),
                                    ChipData('Hiking'),
                                    ChipData('Wine Tasting'),
                                    ChipData('Traveling'),
                                    ChipData('Cricket'),
                                    ChipData('Music Festivals'),
                                    ChipData('Surfing & Swimming'),
                                    ChipData('Cooking'),
                                    ChipData('Gaming'),
                                    ChipData('Photography'),
                                    ChipData('Fine Dining'),
                                    ChipData('Watching Movies'),
                                    ChipData('Yoga and Meditation'),
                                    ChipData('Reading and Book Clubs'),
                                    ChipData('Fitness and Gym'),
                                    ChipData('Community Service'),
                                    ChipData('Bird Watching'),
                                    ChipData('Scuba Diving'),
                                    ChipData('Horse Riding'),
                                    ChipData('Running'),
                                    ChipData('Traditional Dance'),
                                    ChipData('Art Exhibitions'),
                                    ChipData('Coffee Culture'),
                                    ChipData('Cycling'),
                                    ChipData('Mountain Biking'),
                                    ChipData('Self-Improvement'),
                                    ChipData('Outdoor Camping'),
                                    ChipData('Environmental Activism'),
                                    ChipData('Board Games'),
                                    ChipData('Trivia Nights'),
                                    ChipData('Pub Crawls'),
                                    ChipData('Fishing'),
                                    ChipData('Fashion Design'),
                                    ChipData('Stand-Up Comedy'),
                                    ChipData('Spirituality and Religion'),
                                    ChipData('Wildlife Conservation'),
                                    ChipData('Animal Rescue'),
                                    ChipData('Pet Care'),
                                    ChipData('Blogging'),
                                    ChipData('Markets'),
                                    ChipData('Road Trips'),
                                    ChipData('Baking'),
                                    ChipData('Entrepreneurship'),
                                    ChipData('Social Media Influencing'),
                                    ChipData('Digital Art'),
                                    ChipData('Dog Training'),
                                    ChipData('South African Cuisine'),
                                    ChipData('Astronomy and Stargazing')
                                  ],
                                  onChanged: (val) => safeSetState(() =>
                                      _model.interestChoiceChipsValues = val),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyLargeIsCustom,
                                        ),
                                    iconColor:
                                        FlutterFlowTheme.of(context).info,
                                    iconSize: 0.0,
                                    elevation: 2.0,
                                    borderColor: Colors.white,
                                    borderWidth: 1.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 0.0,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  chipSpacing: 10.0,
                                  rowSpacing: 10.0,
                                  multiselect: true,
                                  initialized:
                                      _model.interestChoiceChipsValues != null,
                                  alignment: WrapAlignment.center,
                                  controller: _model
                                          .interestChoiceChipsValueController ??=
                                      FormFieldController<List<String>>(
                                    [],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('sortedButton pressed ...');
                          },
                          text: 'Finish en klaar',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.75,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
