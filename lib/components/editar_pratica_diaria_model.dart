import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'editar_pratica_diaria_widget.dart' show EditarPraticaDiariaWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditarPraticaDiariaModel
    extends FlutterFlowModel<EditarPraticaDiariaWidget> {
  ///  Local state fields for this component.

  double valorMoeda = 0.0;

  List<MaiorValorDiaStruct> listaMelhoresDias = [];
  void addToListaMelhoresDias(MaiorValorDiaStruct item) =>
      listaMelhoresDias.add(item);
  void removeFromListaMelhoresDias(MaiorValorDiaStruct item) =>
      listaMelhoresDias.remove(item);
  void removeAtIndexFromListaMelhoresDias(int index) =>
      listaMelhoresDias.removeAt(index);
  void insertAtIndexInListaMelhoresDias(int index, MaiorValorDiaStruct item) =>
      listaMelhoresDias.insert(index, item);
  void updateListaMelhoresDiasAtIndex(
          int index, Function(MaiorValorDiaStruct) updateFn) =>
      listaMelhoresDias[index] = updateFn(listaMelhoresDias[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtDataPratica widget.
  FocusNode? txtDataPraticaFocusNode;
  TextEditingController? txtDataPraticaTextController;
  final txtDataPraticaMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      txtDataPraticaTextControllerValidator;
  // State field(s) for txtOracao widget.
  FocusNode? txtOracaoFocusNode;
  TextEditingController? txtOracaoTextController;
  String? Function(BuildContext, String?)? txtOracaoTextControllerValidator;
  String? _txtOracaoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória.';
    }

    return null;
  }

  // State field(s) for txtJohrei widget.
  FocusNode? txtJohreiFocusNode;
  TextEditingController? txtJohreiTextController;
  String? Function(BuildContext, String?)? txtJohreiTextControllerValidator;
  String? _txtJohreiTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória.';
    }

    return null;
  }

  // State field(s) for txtEnsinamento widget.
  FocusNode? txtEnsinamentoFocusNode;
  TextEditingController? txtEnsinamentoTextController;
  String? Function(BuildContext, String?)?
      txtEnsinamentoTextControllerValidator;
  String? _txtEnsinamentoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória.';
    }

    return null;
  }

  // State field(s) for txtDonativo widget.
  FocusNode? txtDonativoFocusNode;
  TextEditingController? txtDonativoTextController;
  String? Function(BuildContext, String?)? txtDonativoTextControllerValidator;
  String? _txtDonativoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória.';
    }

    return null;
  }

  // State field(s) for txtDedicacao widget.
  FocusNode? txtDedicacaoFocusNode;
  TextEditingController? txtDedicacaoTextController;
  String? Function(BuildContext, String?)? txtDedicacaoTextControllerValidator;
  String? _txtDedicacaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória.';
    }

    return null;
  }

  // State field(s) for txtEncaminhamento widget.
  FocusNode? txtEncaminhamentoFocusNode;
  TextEditingController? txtEncaminhamentoTextController;
  String? Function(BuildContext, String?)?
      txtEncaminhamentoTextControllerValidator;
  String? _txtEncaminhamentoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informação obrigatória.';
    }

    return null;
  }

  // State field(s) for txtRelato widget.
  FocusNode? txtRelatoFocusNode;
  TextEditingController? txtRelatoTextController;
  String? Function(BuildContext, String?)? txtRelatoTextControllerValidator;
  // Stores action output result for [Custom Action - verificaErro] action in ButtonAlterar widget.
  bool? erro;
  Completer<List<DiarioRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (get lista maior valores dia)] action in ButtonAlterar widget.
  ApiCallResponse? saidaApi;

  @override
  void initState(BuildContext context) {
    txtOracaoTextControllerValidator = _txtOracaoTextControllerValidator;
    txtJohreiTextControllerValidator = _txtJohreiTextControllerValidator;
    txtEnsinamentoTextControllerValidator =
        _txtEnsinamentoTextControllerValidator;
    txtDonativoTextControllerValidator = _txtDonativoTextControllerValidator;
    txtDedicacaoTextControllerValidator = _txtDedicacaoTextControllerValidator;
    txtEncaminhamentoTextControllerValidator =
        _txtEncaminhamentoTextControllerValidator;
  }

  @override
  void dispose() {
    txtDataPraticaFocusNode?.dispose();
    txtDataPraticaTextController?.dispose();

    txtOracaoFocusNode?.dispose();
    txtOracaoTextController?.dispose();

    txtJohreiFocusNode?.dispose();
    txtJohreiTextController?.dispose();

    txtEnsinamentoFocusNode?.dispose();
    txtEnsinamentoTextController?.dispose();

    txtDonativoFocusNode?.dispose();
    txtDonativoTextController?.dispose();

    txtDedicacaoFocusNode?.dispose();
    txtDedicacaoTextController?.dispose();

    txtEncaminhamentoFocusNode?.dispose();
    txtEncaminhamentoTextController?.dispose();

    txtRelatoFocusNode?.dispose();
    txtRelatoTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
