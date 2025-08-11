import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single_my_profile_edit_model.dart';
export 'single_my_profile_edit_model.dart';

class SingleMyProfileEditWidget extends StatefulWidget {
  const SingleMyProfileEditWidget({
    super.key,
    required this.pageTitle,
    this.currentSelection,
    required this.lifestyleCategory,
  });

  final String? pageTitle;
  final String? currentSelection;
  final String? lifestyleCategory;

  @override
  State<SingleMyProfileEditWidget> createState() =>
      _SingleMyProfileEditWidgetState();
}

class _SingleMyProfileEditWidgetState extends State<SingleMyProfileEditWidget> {
  late SingleMyProfileEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleMyProfileEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: 40.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    safeSetState(() {
                                      _model.educationChoiceChipsValueController
                                          ?.value = ['\"\"'];
                                    });
                                  },
                                  child: Icon(
                                    FFIcons.keraser,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.pageTitle,
                            'Header',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontSize: 21.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget!.lifestyleCategory == 'education')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Bachelor Degree'),
                              ChipData('At Uni'),
                              ChipData('High School'),
                              ChipData('PhD'),
                              ChipData('Graduate Programme'),
                              ChipData('Master Degree'),
                              ChipData('Trade School')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .educationChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized:
                                _model.educationChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.educationChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'family')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('I Want Children'),
                              ChipData('I Don\'t Want Children'),
                              ChipData('I have children and want more'),
                              ChipData('I have children and don\'t want more'),
                              ChipData('Not sure yet')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .familyChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized: _model.familyChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.familyChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'communication')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Big time texter'),
                              ChipData('Phone caller'),
                              ChipData('Video Chatter'),
                              ChipData('Bad texter'),
                              ChipData('Better in person')
                            ],
                            onChanged: (val) => safeSetState(() =>
                                _model.communicationChoiceChipsValue =
                                    val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized:
                                _model.communicationChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller: _model
                                    .communicationChoiceChipsValueController ??=
                                FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'loveStyle')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Thoughtful gestures'),
                              ChipData('Presents'),
                              ChipData('Touch'),
                              ChipData('Compliments'),
                              ChipData('Time Together')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .loveStyleChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized:
                                _model.loveStyleChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.loveStyleChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'pets')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Dog'),
                              ChipData('Cat'),
                              ChipData('Bird'),
                              ChipData('Rabbit')
                            ],
                            onChanged: (val) => safeSetState(() =>
                                _model.petChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized: _model.petChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller: _model.petChoiceChipsValueController ??=
                                FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'drinking')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Don\'t Drink'),
                              ChipData('On Special Occasions'),
                              ChipData('Every Day'),
                              ChipData('Only Weekends'),
                              ChipData('Too Expensive')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .drinkingChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized:
                                _model.drinkingChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.drinkingChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'smoking')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Social Smoker'),
                              ChipData('Smoke When Drinking'),
                              ChipData('Don\'t Smoke'),
                              ChipData('Smoker'),
                              ChipData('Trying to stop')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .smokingChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized: _model.smokingChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.smokingChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'workout')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Every Day'),
                              ChipData('Often'),
                              ChipData('Sometimes'),
                              ChipData('Never')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .workoutChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized: _model.workoutChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.workoutChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'diet')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Vegan'),
                              ChipData('Vegetarian'),
                              ChipData('Pescatarian'),
                              ChipData('Kosher'),
                              ChipData('Halal'),
                              ChipData('Carnivore'),
                              ChipData('Omnivore'),
                              ChipData('Other')
                            ],
                            onChanged: (val) => safeSetState(() =>
                                _model.dietChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized: _model.dietChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.dietChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'socialMedia')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Every Day'),
                              ChipData('Often'),
                              ChipData('Sometimes'),
                              ChipData('Never')
                            ],
                            onChanged: (val) => safeSetState(() =>
                                _model.socialMediaChoiceChipsValue =
                                    val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized:
                                _model.socialMediaChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.socialMediaChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'sleeping')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Early Bird'),
                              ChipData('Night Owl'),
                              ChipData('It varies')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .sleepingChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized:
                                _model.sleepingChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.sleepingChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget!.lifestyleCategory == 'religion')
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 20.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FlutterFlowChoiceChips(
                            options: [
                              ChipData('Christian'),
                              ChipData('Budda'),
                              ChipData('Non_religious')
                            ],
                            onChanged: (val) => safeSetState(() => _model
                                .religionChoiceChipsValue = val?.firstOrNull),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 14.0,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized:
                                _model.religionChoiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.religionChoiceChipsValueController ??=
                                    FormFieldController<List<String>>(
                              [
                                valueOrDefault<String>(
                                  widget!.currentSelection != null &&
                                          widget!.currentSelection != ''
                                      ? widget!.currentSelection
                                      : '',
                                  'Select',
                                )
                              ],
                            ),
                            wrapped: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 35.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelLargeIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () {
                            if ((widget!.lifestyleCategory == 'pets') &&
                                (widget!.currentSelection ==
                                    _model.petChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'drinking') &&
                                (widget!.currentSelection ==
                                    _model.drinkingChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'smoking') &&
                                (widget!.currentSelection ==
                                    _model.smokingChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'workout') &&
                                (widget!.currentSelection ==
                                    _model.workoutChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory == 'diet') &&
                                (widget!.currentSelection ==
                                    _model.dietChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'socialMedia') &&
                                (widget!.currentSelection ==
                                    _model.socialMediaChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'sleeping') &&
                                (widget!.currentSelection ==
                                    _model.sleepingChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'education') &&
                                (widget!.currentSelection ==
                                    _model.educationChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'family') &&
                                (widget!.currentSelection ==
                                    _model.familyChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'communication') &&
                                (widget!.currentSelection ==
                                    _model.communicationChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'loveStyle') &&
                                (widget!.currentSelection ==
                                    _model.loveStyleChoiceChipsValue)) {
                              return true;
                            } else if ((widget!.lifestyleCategory ==
                                    'religion') &&
                                (widget!.currentSelection ==
                                    _model.religionChoiceChipsValue)) {
                              return true;
                            } else {
                              return false;
                            }
                          }()
                              ? null
                              : () async {
                                  Navigator.pop(context, () {
                                    if (widget!.lifestyleCategory == 'pets') {
                                      return _model.petChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'drinking') {
                                      return _model.drinkingChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'smoking') {
                                      return _model.smokingChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'workout') {
                                      return _model.workoutChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'diet') {
                                      return _model.dietChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'socialMedia') {
                                      return _model.socialMediaChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'sleeping') {
                                      return _model.sleepingChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'education') {
                                      return _model.educationChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'family') {
                                      return _model.familyChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'communication') {
                                      return valueOrDefault<String>(
                                        widget!.lifestyleCategory ==
                                                'communication'
                                            ? _model
                                                .communicationChoiceChipsValue
                                            : 'Select',
                                        'Select',
                                      );
                                    } else if (widget!.lifestyleCategory ==
                                        'loveStyle') {
                                      return _model.loveStyleChoiceChipsValue;
                                    } else if (widget!.lifestyleCategory ==
                                        'religion') {
                                      return _model.religionChoiceChipsValue;
                                    } else {
                                      return '';
                                    }
                                  }());
                                },
                          text: 'Apply',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 35.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelLargeIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).transparent,
                            disabledTextColor:
                                FlutterFlowTheme.of(context).accent4,
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
