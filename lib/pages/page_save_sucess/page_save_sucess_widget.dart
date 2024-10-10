import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'page_save_sucess_model.dart';
export 'page_save_sucess_model.dart';

class PageSaveSucessWidget extends StatefulWidget {
  const PageSaveSucessWidget({super.key});

  @override
  State<PageSaveSucessWidget> createState() => _PageSaveSucessWidgetState();
}

class _PageSaveSucessWidgetState extends State<PageSaveSucessWidget> {
  late PageSaveSucessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageSaveSucessModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pessoa = await PessoaTable().queryRows(
        queryFn: (q) => q.eq(
          'idUsuario',
          currentUserUid,
        ),
      );
      _model.pessoaLogadaSucess = _model.pessoa?.first;
      safeSetState(() {});
      await Future.delayed(const Duration(milliseconds: 3000));

      context.pushNamed(
        'AdicionarPraticas',
        queryParameters: {
          'paramPessoa': serializeParam(
            _model.pessoa?.first,
            ParamType.SupabaseRow,
          ),
        }.withoutNulls,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 300.0,
              height: 700.0,
              decoration: BoxDecoration(),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 50.0, 20.0, 0.0),
                          child: Lottie.asset(
                            'assets/lottie_animations/Animation_-_1723728001878.json',
                            width: 200.0,
                            height: 180.0,
                            fit: BoxFit.contain,
                            repeat: false,
                            animate: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
