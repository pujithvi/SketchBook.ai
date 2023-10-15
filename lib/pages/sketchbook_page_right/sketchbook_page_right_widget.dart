import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sketchbook_page_right_model.dart';
export 'sketchbook_page_right_model.dart';

class SketchbookPageRightWidget extends StatefulWidget {
  const SketchbookPageRightWidget({
    Key? key,
    required this.docRef,
    required this.index,
  }) : super(key: key);

  final DocumentReference? docRef;
  final int? index;

  @override
  _SketchbookPageRightWidgetState createState() =>
      _SketchbookPageRightWidgetState();
}

class _SketchbookPageRightWidgetState extends State<SketchbookPageRightWidget> {
  late SketchbookPageRightModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SketchbookPageRightModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.document = await SketchBooksRecord.getDocumentOnce(widget.docRef!);
      setState(() {
        FFAppState().finalDisplayedText =
            _model.document!.scenes[widget.index!];
        FFAppState().finalDisplayedImagePath =
            _model.document!.images[widget.index!];
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          image: DecorationImage(
            fit: BoxFit.fill,
            alignment: AlignmentDirectional(0.00, 0.00),
            image: Image.asset(
              'assets/images/right_notebook.jpg',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 100.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      Icons.exit_to_app,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('HomePage');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 70.0, 50.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  FFAppState().finalDisplayedImagePath,
                  width: 270.0,
                  height: 270.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: 270.0,
                    height: 270.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 70.0, 50.0),
                child: Text(
                  FFAppState().finalDisplayedText,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 25.0,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 70.0, 80.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 200.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).secondary,
                      icon: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        setState(() {
                          FFAppState().newIndex = widget.index!;
                        });
                        setState(() {
                          FFAppState().newIndex = FFAppState().newIndex + -1;
                        });
                        if (FFAppState().newIndex >= 0) {
                          context.pushNamed(
                            'SketchbookPageLeft',
                            queryParameters: {
                              'docRef': serializeParam(
                                _model.document?.reference,
                                ParamType.DocumentReference,
                              ),
                              'index': serializeParam(
                                FFAppState().newIndex,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      Icons.chevron_right,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      setState(() {
                        FFAppState().newIndex = widget.index!;
                      });
                      setState(() {
                        FFAppState().newIndex = FFAppState().newIndex + 1;
                      });
                      if (FFAppState().newIndex <
                          _model.document!.scenes.length) {
                        context.pushNamed(
                          'SketchbookPageLeft',
                          queryParameters: {
                            'index': serializeParam(
                              FFAppState().newIndex,
                              ParamType.int,
                            ),
                            'docRef': serializeParam(
                              _model.document?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        if ((currentUserDocument?.sketchbooks?.toList() ?? [])
                                .contains(widget.docRef) ==
                            true) {
                          context.pushNamed('HomePage');
                        } else {
                          context.pushNamed(
                            'SaveSketchbook',
                            queryParameters: {
                              'docRef': serializeParam(
                                widget.docRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
