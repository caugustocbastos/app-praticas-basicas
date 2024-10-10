import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_fake_widget.dart' show HomePageFakeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageFakeModel extends FlutterFlowModel<HomePageFakeWidget> {
  ///  Local state fields for this page.

  List<DiarioRow> listaDiario = [];
  void addToListaDiario(DiarioRow item) => listaDiario.add(item);
  void removeFromListaDiario(DiarioRow item) => listaDiario.remove(item);
  void removeAtIndexFromListaDiario(int index) => listaDiario.removeAt(index);
  void insertAtIndexInListaDiario(int index, DiarioRow item) =>
      listaDiario.insert(index, item);
  void updateListaDiarioAtIndex(int index, Function(DiarioRow) updateFn) =>
      listaDiario[index] = updateFn(listaDiario[index]);

  PessoaRow? pessoaLogada;

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - appVersion] action in HomePageFake widget.
  String? appVersao;
  // Stores action output result for [Backend Call - Query Rows] action in HomePageFake widget.
  List<VersaoappRow>? ultimaVersao;
  // Stores action output result for [Backend Call - Query Rows] action in HomePageFake widget.
  List<PessoaRow>? pessoa;
  // Stores action output result for [Backend Call - Query Rows] action in HomePageFake widget.
  List<DiarioRow>? inicialRowDiario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
