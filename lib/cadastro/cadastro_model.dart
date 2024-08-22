import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  Local state fields for this page.

  List<UnidadeRow> listaUnidade = [];
  void addToListaUnidade(UnidadeRow item) => listaUnidade.add(item);
  void removeFromListaUnidade(UnidadeRow item) => listaUnidade.remove(item);
  void removeAtIndexFromListaUnidade(int index) => listaUnidade.removeAt(index);
  void insertAtIndexInListaUnidade(int index, UnidadeRow item) =>
      listaUnidade.insert(index, item);
  void updateListaUnidadeAtIndex(int index, Function(UnidadeRow) updateFn) =>
      listaUnidade[index] = updateFn(listaUnidade[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeCadastro widget.
  FocusNode? nomeCadastroFocusNode;
  TextEditingController? nomeCadastroTextController;
  String? Function(BuildContext, String?)? nomeCadastroTextControllerValidator;
  String? _nomeCadastroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 3) {
      return 'Pelo menos 3 letras';
    }

    return null;
  }

  // State field(s) for Dd-Igreja-Cadastro widget.
  String? ddIgrejaCadastroValue;
  FormFieldController<String>? ddIgrejaCadastroValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Dd-Igreja-Cadastro widget.
  List<UnidadeRow>? outUnidade;
  // State field(s) for Dd-Unidade-Cadastro widget.
  String? ddUnidadeCadastroValue;
  FormFieldController<String>? ddUnidadeCadastroValueController;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'email no formato incorreto.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 6) {
      return 'Pelo menos 6 caracteres.';
    }

    return null;
  }

  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  String? _passwordConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 6) {
      return 'Pelo menos 6 caracteres.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeCadastroTextControllerValidator = _nomeCadastroTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmTextControllerValidator =
        _passwordConfirmTextControllerValidator;
  }

  @override
  void dispose() {
    nomeCadastroFocusNode?.dispose();
    nomeCadastroTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();
  }
}
