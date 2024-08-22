import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'resetar_senha_widget.dart' show ResetarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetarSenhaModel extends FlutterFlowModel<ResetarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for novaSenha widget.
  FocusNode? novaSenhaFocusNode;
  TextEditingController? novaSenhaTextController;
  late bool novaSenhaVisibility;
  String? Function(BuildContext, String?)? novaSenhaTextControllerValidator;
  // Stores action output result for [Custom Action - resetarSenha] action in Button-Login widget.
  String? erro;

  @override
  void initState(BuildContext context) {
    novaSenhaVisibility = false;
  }

  @override
  void dispose() {
    novaSenhaFocusNode?.dispose();
    novaSenhaTextController?.dispose();
  }
}
