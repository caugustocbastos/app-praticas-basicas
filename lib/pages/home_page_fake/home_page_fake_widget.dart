import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_fake_model.dart';
export 'home_page_fake_model.dart';

class HomePageFakeWidget extends StatefulWidget {
  const HomePageFakeWidget({super.key});

  @override
  State<HomePageFakeWidget> createState() => _HomePageFakeWidgetState();
}

class _HomePageFakeWidgetState extends State<HomePageFakeWidget> {
  late HomePageFakeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageFakeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.appVersao = await actions.appVersion();
      FFAppState().appVersao = _model.appVersao!;
      setState(() {});
      _model.pessoa = await PessoaTable().queryRows(
        queryFn: (q) => q.eq(
          'idUsuario',
          currentUserUid,
        ),
      );
      _model.pessoaLogada = _model.pessoa?.first;
      setState(() {});
      _model.inicialRowDiario = await DiarioTable().queryRows(
        queryFn: (q) => q
            .eq(
              'idPessoa',
              _model.pessoa?.first?.id,
            )
            .eq(
              'data',
              supaSerialize<DateTime>(
                  functions.somenteData(getCurrentTimestamp)),
            ),
      );
      if (_model.inicialRowDiario != null &&
          (_model.inicialRowDiario)!.isNotEmpty) {
        context.pushNamed(
          'AdicionarPraticas',
          queryParameters: {
            'paramPessoa': serializeParam(
              _model.pessoaLogada,
              ParamType.SupabaseRow,
            ),
            'paramRowDiarioHome': serializeParam(
              _model.inicialRowDiario?.first,
              ParamType.SupabaseRow,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        context.pushNamed(
          'AdicionarPraticas',
          queryParameters: {
            'paramPessoa': serializeParam(
              _model.pessoaLogada,
              ParamType.SupabaseRow,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
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

    return FutureBuilder<List<PessoaRow>>(
      future: FFAppState().consultaPessoa(
        requestFn: () => PessoaTable().querySingleRow(
          queryFn: (q) => q.eq(
            'idUsuario',
            currentUserUid,
          ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PessoaRow> homePageFakePessoaRowList = snapshot.data!;

        final homePageFakePessoaRow = homePageFakePessoaRowList.isNotEmpty
            ? homePageFakePessoaRowList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                FFAppConstants.TituloAplicativo,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.saudacao(),
                            'Bom dia!',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.primeiroNome(homePageFakePessoaRow?.nome),
                            'nome',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
