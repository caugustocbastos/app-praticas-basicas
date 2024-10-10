import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'adicionar_praticas_model.dart';
export 'adicionar_praticas_model.dart';

class AdicionarPraticasWidget extends StatefulWidget {
  const AdicionarPraticasWidget({
    super.key,
    required this.paramPessoa,
    this.paramRowDiarioHome,
  });

  final PessoaRow? paramPessoa;
  final DiarioRow? paramRowDiarioHome;

  @override
  State<AdicionarPraticasWidget> createState() =>
      _AdicionarPraticasWidgetState();
}

class _AdicionarPraticasWidgetState extends State<AdicionarPraticasWidget> {
  late AdicionarPraticasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdicionarPraticasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dataSelecionada2 = getCurrentTimestamp;
      safeSetState(() {});
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
      _model.saidaRowDiarioInicial = await DiarioTable().queryRows(
        queryFn: (q) => q
            .eq(
              'idPessoa',
              widget!.paramPessoa?.id,
            )
            .eq(
              'data',
              supaSerialize<DateTime>(
                  functions.somenteData(getCurrentTimestamp)),
            ),
      );
      if (_model.saidaRowDiarioInicial != null &&
          (_model.saidaRowDiarioInicial)!.isNotEmpty) {
        _model.rowDiario = _model.saidaRowDiarioInicial?.first;
        safeSetState(() {});
        safeSetState(() {
          _model.txtOracaoTextController?.text = valueOrDefault<String>(
            formatNumber(
              _model.rowDiario?.oracao,
              formatType: FormatType.custom,
              format: '',
              locale: 'pt_BR',
            ),
            '0',
          );
          _model.txtOracaoTextController?.selection = TextSelection.collapsed(
              offset: _model.txtOracaoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtJohreiTextController?.text = valueOrDefault<String>(
            formatNumber(
              _model.rowDiario?.johrei,
              formatType: FormatType.custom,
              format: '',
              locale: '',
            ),
            '0',
          );
          _model.txtJohreiTextController?.selection = TextSelection.collapsed(
              offset: _model.txtJohreiTextController!.text.length);
        });
        safeSetState(() {
          _model.txtEnsinamentoTextController?.text = valueOrDefault<String>(
            formatNumber(
              _model.rowDiario?.ensinamento,
              formatType: FormatType.custom,
              format: '',
              locale: '',
            ),
            '0',
          );
          _model.txtEnsinamentoTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtEnsinamentoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtDonativoTextController?.text = valueOrDefault<String>(
            formatNumber(
              _model.rowDiario?.donativo,
              formatType: FormatType.custom,
              currency: 'R\$',
              format: '#,##0.00',
              locale: 'pt_BR',
            ),
            '0',
          );
          _model.txtDonativoTextController?.selection = TextSelection.collapsed(
              offset: _model.txtDonativoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtDedicacaoTextController?.text = valueOrDefault<String>(
            formatNumber(
              _model.rowDiario?.dedicacao,
              formatType: FormatType.custom,
              format: '',
              locale: '',
            ),
            '0',
          );
          _model.txtDedicacaoTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtDedicacaoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtEncaminhamentoTextController?.text = valueOrDefault<String>(
            formatNumber(
              _model.rowDiario?.encaminhamento,
              formatType: FormatType.custom,
              format: '',
              locale: '',
            ),
            '0',
          );
          _model.txtEncaminhamentoTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtEncaminhamentoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtRelatoTextController?.text = _model.rowDiario!.relato!;
          _model.txtRelatoTextController?.selection = TextSelection.collapsed(
              offset: _model.txtRelatoTextController!.text.length);
        });
        _model.valorMoeda2 = valueOrDefault<double>(
          _model.rowDiario?.donativo,
          0.0,
        );
        safeSetState(() {});
        return;
      } else {
        _model.rowDiario = null;
        safeSetState(() {});
        safeSetState(() {
          _model.txtOracaoTextController?.text = valueOrDefault<String>(
            _model.rowDiario?.oracao.toString(),
            '0',
          );
          _model.txtOracaoTextController?.selection = TextSelection.collapsed(
              offset: _model.txtOracaoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtJohreiTextController?.text = valueOrDefault<String>(
            _model.rowDiario?.johrei?.toString(),
            '0',
          );
          _model.txtJohreiTextController?.selection = TextSelection.collapsed(
              offset: _model.txtJohreiTextController!.text.length);
        });
        safeSetState(() {
          _model.txtEnsinamentoTextController?.text = valueOrDefault<String>(
            _model.rowDiario?.ensinamento?.toString(),
            '0',
          );
          _model.txtEnsinamentoTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtEnsinamentoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtDonativoTextController?.text = 'R\$0,00';
          _model.txtDonativoTextController?.selection = TextSelection.collapsed(
              offset: _model.txtDonativoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtDedicacaoTextController?.text = valueOrDefault<String>(
            _model.rowDiario?.dedicacao?.toString(),
            '0',
          );
          _model.txtDedicacaoTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtDedicacaoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtEncaminhamentoTextController?.text = valueOrDefault<String>(
            _model.rowDiario?.encaminhamento?.toString(),
            '0',
          );
          _model.txtEncaminhamentoTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtEncaminhamentoTextController!.text.length);
        });
        safeSetState(() {
          _model.txtRelatoTextController?.text = _model.rowDiario!.relato!;
          _model.txtRelatoTextController?.selection = TextSelection.collapsed(
              offset: _model.txtRelatoTextController!.text.length);
        });
        return;
      }
    });

    _model.txtDataPraticaTextController ??= TextEditingController();
    _model.txtDataPraticaFocusNode ??= FocusNode();
    _model.txtDataPraticaFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtOracaoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.rowDiario?.oracao.toString(),
      '0',
    ));
    _model.txtOracaoFocusNode ??= FocusNode();
    _model.txtOracaoFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtJohreiTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.rowDiario?.johrei?.toString(),
      '0',
    ));
    _model.txtJohreiFocusNode ??= FocusNode();
    _model.txtJohreiFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtEnsinamentoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.rowDiario?.ensinamento.toString(),
      '0',
    ));
    _model.txtEnsinamentoFocusNode ??= FocusNode();
    _model.txtEnsinamentoFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtDonativoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      formatNumber(
        _model.rowDiario?.donativo,
        formatType: FormatType.custom,
        currency: 'R\$',
        format: '#,##0.00',
        locale: 'pt_BR',
      ),
      '0',
    ));
    _model.txtDonativoFocusNode ??= FocusNode();
    _model.txtDonativoFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtDedicacaoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.rowDiario?.dedicacao.toString(),
      '0',
    ));
    _model.txtDedicacaoFocusNode ??= FocusNode();
    _model.txtDedicacaoFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtEncaminhamentoTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.rowDiario?.encaminhamento.toString(),
      '0',
    ));
    _model.txtEncaminhamentoFocusNode ??= FocusNode();
    _model.txtEncaminhamentoFocusNode!.addListener(() => safeSetState(() {}));
    _model.txtRelatoTextController ??=
        TextEditingController(text: _model.rowDiario?.relato);
    _model.txtRelatoFocusNode ??= FocusNode();
    _model.txtRelatoFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.txtDataPraticaTextController?.text = dateTimeFormat(
            "d/M/y",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DiarioRow>>(
      future: (_model.requestCompleter ??= Completer<List<DiarioRow>>()
            ..complete(DiarioTable().querySingleRow(
              queryFn: (q) => q
                  .eq(
                    'idPessoa',
                    widget!.paramPessoa?.id,
                  )
                  .eq(
                    'data',
                    supaSerialize<DateTime>(
                        functions.somenteData(getCurrentTimestamp)),
                  ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<DiarioRow> adicionarPraticasDiarioRowList = snapshot.data!;

        final adicionarPraticasDiarioRow =
            adicionarPraticasDiarioRowList.isNotEmpty
                ? adicionarPraticasDiarioRowList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Práticas do dia',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              'Informe suas práticas diárias',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 2.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: 12.0,
                            borderWidth: 0.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.home_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 35.0,
                            ),
                            onPressed: () async {
                              context.pushNamed('HomePage');
                            },
                          ),
                        ),
                      ),
                    ].addToStart(SizedBox(width: 20.0)),
                  ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 5.0),
                                child: SafeArea(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 770.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  width: 295.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .txtDataPraticaTextController,
                                                    focusNode: _model
                                                        .txtDataPraticaFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.txtDataPraticaTextController',
                                                      Duration(
                                                          milliseconds: 10),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Dia da Prática (Selecione no calendário)',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  20.0,
                                                                  16.0,
                                                                  20.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.datetime,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    validator: _model
                                                        .txtDataPraticaTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      _model.txtDataPraticaMask
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 8.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 45.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.calendar_month,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      final _datePickedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            getCurrentTimestamp,
                                                        firstDate:
                                                            DateTime(1900),
                                                        lastDate:
                                                            getCurrentTimestamp,
                                                        builder:
                                                            (context, child) {
                                                          return wrapInMaterialDatePickerTheme(
                                                            context,
                                                            child!,
                                                            headerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            headerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            headerTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          32.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                            pickerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            pickerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            selectedDateTimeBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            selectedDateTimeForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            actionButtonForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            iconSize: 24.0,
                                                          );
                                                        },
                                                      );

                                                      if (_datePickedDate !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked =
                                                              DateTime(
                                                            _datePickedDate
                                                                .year,
                                                            _datePickedDate
                                                                .month,
                                                            _datePickedDate.day,
                                                          );
                                                        });
                                                      }
                                                      await Future.wait([
                                                        Future(() async {
                                                          safeSetState(() {
                                                            _model.txtDataPraticaTextController
                                                                    ?.text =
                                                                dateTimeFormat(
                                                              "d/M/y",
                                                              _model.datePicked,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            );
                                                            _model.txtDataPraticaTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .txtDataPraticaTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        }),
                                                        Future(() async {
                                                          _model.dataSelecionada2 =
                                                              _model.datePicked;
                                                          safeSetState(() {});
                                                          if (_model
                                                                  .datePicked ==
                                                              null) {
                                                            _model.dataSelecionada2 =
                                                                functions
                                                                    .somenteData(
                                                                        getCurrentTimestamp);
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model.txtDataPraticaTextController
                                                                      ?.text =
                                                                  dateTimeFormat(
                                                                "d/M/y",
                                                                getCurrentTimestamp,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              );
                                                              _model.txtDataPraticaTextController
                                                                      ?.selection =
                                                                  TextSelection.collapsed(
                                                                      offset: _model
                                                                          .txtDataPraticaTextController!
                                                                          .text
                                                                          .length);
                                                            });
                                                          }
                                                        }),
                                                      ]);
                                                      _model.saidaRowDiarioCalendar =
                                                          await DiarioTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .eq(
                                                              'idPessoa',
                                                              widget!
                                                                  .paramPessoa
                                                                  ?.id,
                                                            )
                                                            .eq(
                                                              'data',
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  functions
                                                                      .somenteData(
                                                                          _model
                                                                              .datePicked)),
                                                            ),
                                                      );
                                                      if (_model.saidaRowDiarioCalendar !=
                                                              null &&
                                                          (_model.saidaRowDiarioCalendar)!
                                                              .isNotEmpty) {
                                                        _model.rowDiario = _model
                                                            .saidaRowDiarioCalendar
                                                            ?.first;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model.txtOracaoTextController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              _model.rowDiario
                                                                  ?.oracao,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '',
                                                              locale: '',
                                                            ),
                                                            '0',
                                                          );
                                                          _model.txtOracaoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtOracaoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model.txtJohreiTextController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              _model.rowDiario
                                                                  ?.johrei,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '',
                                                              locale: '',
                                                            ),
                                                            '0',
                                                          );
                                                          _model.txtJohreiTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtJohreiTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model.txtEnsinamentoTextController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              _model.rowDiario
                                                                  ?.ensinamento,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '',
                                                              locale: '',
                                                            ),
                                                            '0',
                                                          );
                                                          _model.txtEnsinamentoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtEnsinamentoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model.txtDonativoTextController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              _model.rowDiario
                                                                  ?.donativo,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              currency: 'R\$',
                                                              format:
                                                                  '#,##0.00',
                                                              locale: 'pt_BR',
                                                            ),
                                                            '0',
                                                          );
                                                          _model.txtDonativoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtDonativoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model.txtDedicacaoTextController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              _model.rowDiario
                                                                  ?.dedicacao,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '',
                                                              locale: '',
                                                            ),
                                                            '0',
                                                          );
                                                          _model.txtDedicacaoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtDedicacaoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model.txtEncaminhamentoTextController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            formatNumber(
                                                              _model.rowDiario
                                                                  ?.encaminhamento,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '',
                                                              locale: '',
                                                            ),
                                                            '0',
                                                          );
                                                          _model.txtEncaminhamentoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtEncaminhamentoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model.txtRelatoTextController
                                                                  ?.text =
                                                              _model.rowDiario!
                                                                  .relato!;
                                                          _model.txtRelatoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtRelatoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        _model.valorMoeda2 =
                                                            valueOrDefault<
                                                                double>(
                                                          _model.rowDiario
                                                              ?.donativo,
                                                          0.0,
                                                        );
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.rowDiario = null;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model.txtOracaoTextController
                                                                  ?.text =
                                                              valueOrDefault<
                                                                  String>(
                                                            _model.rowDiario
                                                                ?.oracao
                                                                .toString(),
                                                            '0',
                                                          );
                                                          _model.txtOracaoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtOracaoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model
                                                              .txtJohreiTextController
                                                              ?.text = '0';
                                                          _model.txtJohreiTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtJohreiTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model
                                                              .txtEnsinamentoTextController
                                                              ?.text = '0';
                                                          _model.txtEnsinamentoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtEnsinamentoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model
                                                              .txtDonativoTextController
                                                              ?.text = '0';
                                                          _model.txtDonativoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtDonativoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model
                                                              .txtDedicacaoTextController
                                                              ?.text = '0';
                                                          _model.txtDedicacaoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtDedicacaoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model
                                                              .txtEncaminhamentoTextController
                                                              ?.text = '0';
                                                          _model.txtEncaminhamentoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtEncaminhamentoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        safeSetState(() {
                                                          _model
                                                              .txtRelatoTextController
                                                              ?.text = ' ';
                                                          _model.txtRelatoTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .txtRelatoTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                        _model.valorMoeda2 =
                                                            0.0;
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .txtOracaoTextController,
                                                      focusNode: _model
                                                          .txtOracaoFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.txtOracaoTextController',
                                                        Duration(
                                                            milliseconds: 0),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Oração (Quant. de orações no dia)*',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    20.0,
                                                                    16.0,
                                                                    20.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .txtOracaoTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          safeSetState(() {
                                                            _model.txtOracaoTextController
                                                                    ?.text =
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.decrementaValorTextField(
                                                                  _model
                                                                      .txtOracaoTextController
                                                                      .text),
                                                              '0',
                                                            );
                                                            _model.txtOracaoTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .txtOracaoTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text: '',
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 0.0,
                                                        ),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          safeSetState(() {
                                                            _model.txtOracaoTextController
                                                                    ?.text =
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.incrementaValorTextField(
                                                                  _model
                                                                      .txtOracaoTextController
                                                                      .text),
                                                              '0',
                                                            );
                                                            _model.txtOracaoTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .txtOracaoTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text: '',
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 29.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 0.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .txtJohreiTextController,
                                                      focusNode: _model
                                                          .txtJohreiFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.txtJohreiTextController',
                                                        Duration(
                                                            milliseconds: 0),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .none,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Johrei  (ministrados e recebidos no dia)*',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            true,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    20.0,
                                                                    16.0,
                                                                    20.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .txtJohreiTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          safeSetState(() {
                                                            _model.txtJohreiTextController
                                                                    ?.text =
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.decrementaValorTextField(
                                                                  _model
                                                                      .txtJohreiTextController
                                                                      .text),
                                                              '0',
                                                            );
                                                            _model.txtJohreiTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .txtJohreiTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text: '',
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 0.0,
                                                        ),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          safeSetState(() {
                                                            _model.txtJohreiTextController
                                                                    ?.text =
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.incrementaValorTextField(
                                                                  _model
                                                                      .txtJohreiTextController
                                                                      .text),
                                                              '0',
                                                            );
                                                            _model.txtJohreiTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .txtJohreiTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text: '',
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 29.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 0.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _model
                                                .txtEnsinamentoTextController,
                                            focusNode:
                                                _model.txtEnsinamentoFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.txtEnsinamentoTextController',
                                              Duration(milliseconds: 0),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Ensinamento (minutos de estudo)*',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              errorStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .txtEnsinamentoTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                          TextFormField(
                                            controller: _model
                                                .txtDonativoTextController,
                                            focusNode:
                                                _model.txtDonativoFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.txtDonativoTextController',
                                              Duration(milliseconds: 200),
                                              () async {
                                                _model.valorMoeda2 =
                                                    valueOrDefault<double>(
                                                  functions.currencyRealDouble(
                                                      valueOrDefault<String>(
                                                    _model
                                                        .txtDonativoTextController
                                                        .text,
                                                    '0',
                                                  )),
                                                  0.0,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() {
                                                  _model.txtDonativoTextController
                                                          ?.text =
                                                      functions.formatCurrency(
                                                          _model
                                                              .txtDonativoTextController
                                                              .text);
                                                  _model.txtDonativoTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .txtDonativoTextController!
                                                              .text
                                                              .length);
                                                });
                                              },
                                            ),
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Donativo*',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              errorStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .txtDonativoTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                          TextFormField(
                                            controller: _model
                                                .txtDedicacaoTextController,
                                            focusNode:
                                                _model.txtDedicacaoFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.txtDedicacaoTextController',
                                              Duration(milliseconds: 0),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Dedicação (tempo em minutos)*',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              errorStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .txtDedicacaoTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .txtEncaminhamentoTextController,
                                                      focusNode: _model
                                                          .txtEncaminhamentoFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.txtEncaminhamentoTextController',
                                                        Duration(
                                                            milliseconds: 0),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Encaminhamento*',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    20.0,
                                                                    16.0,
                                                                    20.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .txtEncaminhamentoTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          safeSetState(() {
                                                            _model.txtEncaminhamentoTextController
                                                                    ?.text =
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.decrementaValorTextField(
                                                                  _model
                                                                      .txtEncaminhamentoTextController
                                                                      .text),
                                                              '0',
                                                            );
                                                            _model.txtEncaminhamentoTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .txtEncaminhamentoTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text: '',
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 0.0,
                                                        ),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          safeSetState(() {
                                                            _model.txtEncaminhamentoTextController
                                                                    ?.text =
                                                                functions.incrementaValorTextField(
                                                                    _model
                                                                        .txtEncaminhamentoTextController
                                                                        .text);
                                                            _model.txtEncaminhamentoTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .txtEncaminhamentoTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        },
                                                        text: '',
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 29.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 0.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 2.0,
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Text(
                                            'Você tem algum milagre a relatar hoje?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          TextFormField(
                                            controller:
                                                _model.txtRelatoTextController,
                                            focusNode:
                                                _model.txtRelatoFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.txtRelatoTextController',
                                              Duration(milliseconds: 2000),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Por favor, resuma aqui o milagre.',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              alignLabelWithHint: true,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              errorStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                              suffixIcon: _model
                                                      .txtRelatoTextController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .txtRelatoTextController
                                                            ?.clear();
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                            maxLines: 9,
                                            minLines: 5,
                                            maxLength: 200,
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .txtRelatoTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 7.0))
                                            .around(SizedBox(height: 7.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 770.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.rowDiario == null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  _model.erroInserir =
                                      await actions.verificaErro(
                                    () async {
                                      await DiarioTable().insert({
                                        'idPessoa': widget!.paramPessoa?.id,
                                        'data': supaSerialize<DateTime>(
                                            functions.somenteData(
                                                functions.somenteData(
                                                    _model.dataSelecionada2))),
                                        'johrei': double.tryParse(_model
                                            .txtJohreiTextController.text),
                                        'ensinamento': double.tryParse(_model
                                            .txtEnsinamentoTextController.text),
                                        'donativo': _model.valorMoeda2,
                                        'dedicacao': double.tryParse(_model
                                            .txtDedicacaoTextController.text),
                                        'encaminhamento': double.tryParse(_model
                                            .txtEncaminhamentoTextController
                                            .text),
                                        'relato':
                                            _model.txtRelatoTextController.text,
                                        'semana': functions.isoNumeroSemana(
                                            _model.dataSelecionada2!),
                                        'mes': functions.mesNumero(
                                            _model.dataSelecionada2!),
                                        'ano': functions.anoNumero(
                                            _model.dataSelecionada2!),
                                        'oracao': double.tryParse(_model
                                            .txtOracaoTextController.text),
                                      });
                                    },
                                  );
                                  _shouldSetState = true;
                                  await Future.delayed(
                                      const Duration(milliseconds: 2000));
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  if (_model.erroInserir!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text('Erro ao inserir!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    context.pushNamed('PageSaveSucess');

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    context.pushNamed('PageSaveSucess');

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'Salvar',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).success,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          if (_model.rowDiario != null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  _model.erroUpdateCopy =
                                      await actions.verificaErro(
                                    () async {
                                      await DiarioTable().update(
                                        data: {
                                          'idPessoa': widget!.paramPessoa?.id,
                                          'data': supaSerialize<DateTime>(
                                              functions.somenteData(
                                                  functions.somenteData(_model
                                                      .dataSelecionada2))),
                                          'johrei': valueOrDefault<double>(
                                            double.tryParse(_model
                                                .txtJohreiTextController.text),
                                            0.0,
                                          ),
                                          'ensinamento': double.tryParse(_model
                                              .txtEnsinamentoTextController
                                              .text),
                                          'donativo': _model.valorMoeda2,
                                          'dedicacao': double.tryParse(_model
                                              .txtDedicacaoTextController.text),
                                          'encaminhamento': double.tryParse(_model
                                              .txtEncaminhamentoTextController
                                              .text),
                                          'relato': _model
                                              .txtRelatoTextController.text,
                                          'semana': functions.isoNumeroSemana(
                                              _model.dataSelecionada2!),
                                          'mes': functions.mesNumero(
                                              _model.dataSelecionada2!),
                                          'ano': functions.anoNumero(
                                              _model.dataSelecionada2!),
                                          'oracao': double.tryParse(_model
                                              .txtOracaoTextController.text),
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          _model.rowDiario?.id,
                                        ),
                                      );
                                    },
                                  );
                                  _shouldSetState = true;
                                  safeSetState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                  if (_model.erroUpdateCopy!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text('Erro ao atualizar!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    _model.rowDiario = null;
                                    safeSetState(() {});

                                    context.pushNamed('PageSaveSucess');

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    _model.rowDiario = null;
                                    safeSetState(() {});

                                    context.pushNamed('PageSaveSucess');

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'Alterar',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).success,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
          ),
        );
      },
    );
  }
}
