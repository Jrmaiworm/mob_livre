import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'mapa_logado_model.dart';
export 'mapa_logado_model.dart';

class MapaLogadoWidget extends StatefulWidget {
  const MapaLogadoWidget({
    Key? key,
    this.dadosUser,
  }) : super(key: key);

  final dynamic dadosUser;

  @override
  _MapaLogadoWidgetState createState() => _MapaLogadoWidgetState();
}

class _MapaLogadoWidgetState extends State<MapaLogadoWidget> {
  late MapaLogadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaLogadoModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF1D4F9A),
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (scaffoldKey
                                            .currentState!.isDrawerOpen ||
                                        scaffoldKey
                                            .currentState!.isEndDrawerOpen) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: Color(0xFFD9D9D9),
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: 'circleImageTag',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'circleImageTag',
                                        transitionOnUserGestures: true,
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 20),
                                            child: SelectionArea(
                                                child: Text(
                                              FFAppState().nome,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xC9363636),
                                                      ),
                                            )),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'EditarPerfil',
                                                queryParams: {
                                                  'dadosUser': serializeParam(
                                                    widget.dadosUser,
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'Editar Perfil',
                                            options: FFButtonOptions(
                                              width: 110,
                                              height: 25,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              color: Colors.white,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF1D4F9A),
                                                        fontSize: 14,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Color(0xFF1D4F9A),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Color(0xFF1D4F9A),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                          child: InkWell(
                            onTap: () async {
                              _model.qrCode = await FlutterBarcodeScanner.scanBarcode(
                                '#C62828', // scanning line color
                                'Cancelar', // cancel button text
                                true, // whether to show the flash icon
                                ScanMode.QR,
                              );
                              if (_model.qrCode != null && _model.qrCode != '') {
                                _model.apiResult4dt =
                                    await EquipamentoGroup.gETDetalhesEquipamentoCall.call(
                                  numeroSerieEquipamento: _model.qrCode,
                                );
                                setState(() {
                                  FFAppState().dadosEquipamento =
                                      (_model.apiResult4dt?.jsonBody ?? '');
                                });
                                if ((_model.apiResult4dt?.succeeded ?? true)) {
                                  context.pushNamed(
                                    'DetalheEquipamentoRetirar',
                                    queryParams: {
                                      'detalhesEquip': serializeParam(
                                        (_model.apiResult4dt?.jsonBody ?? ''),
                                        ParamType.JSON,
                                      ),
                                      'detailUser': serializeParam(
                                        getJsonField(
                                          widget.dadosUser,
                                          r'''$''',
                                        ),
                                        ParamType.JSON,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Equipamento não encontrado!',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: FlutterFlowTheme.of(context).alternate,
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Falha ao scanear qrcode.',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                                  ),
                                );
                              }
                              setState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/_icon__wheelchair_.png',
                                  width: MediaQuery.of(context).size.width * 0.08,
                                  height: MediaQuery.of(context).size.height * 0.04,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'Retirar Equipamento',
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/_icon__notifications_.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'Notificações',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: InkWell(
                              onTap: () async {
                                context.pushNamed('Viagens');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/_icon__maps_arrow_.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: SelectionArea(
                                        child: Text(
                                      'Viagens',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: InkWell(
                              onTap: () async {
                                await launchURL('http://www.kitlivre.com/');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/_icon__Store_.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: SelectionArea(
                                        child: Text(
                                      'Acessar Loja',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/_icon__help_circle_.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'Ajuda',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Color(0xFF042D6A),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: SelectionArea(
                                            child: Text(
                                          'Sair',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                        )),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().emailCadastro = '';
                                            FFAppState().senhaCadastro = '';
                                            FFAppState().receberEmail = false;
                                            FFAppState().emailEsqueciSenha = '';
                                            FFAppState().emailLogado = '';
                                            FFAppState().nome = '';
                                            FFAppState().emailPersist = '';
                                            FFAppState().documento = '';
                                          });

                                          context.goNamed('MapaDeslogado');

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Você foi desconectado.',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFF606060),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.exit_to_app,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: ParceiroGroup.gETParceirosCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final googleMapGETParceirosResponse = snapshot.data!;
                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??=
                                currentUserLocationValue!,
                            markerColor: GoogleMarkerColor.violet,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.88, -0.96),
                      child: InkWell(
                        onTap: () async {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Color(0xFF1D4F9A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.menu_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
