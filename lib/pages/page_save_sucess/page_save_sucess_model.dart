import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'page_save_sucess_widget.dart' show PageSaveSucessWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PageSaveSucessModel extends FlutterFlowModel<PageSaveSucessWidget> {
  ///  Local state fields for this page.

  List<DiarioRow> listaDiarioSucess = [];
  void addToListaDiarioSucess(DiarioRow item) => listaDiarioSucess.add(item);
  void removeFromListaDiarioSucess(DiarioRow item) =>
      listaDiarioSucess.remove(item);
  void removeAtIndexFromListaDiarioSucess(int index) =>
      listaDiarioSucess.removeAt(index);
  void insertAtIndexInListaDiarioSucess(int index, DiarioRow item) =>
      listaDiarioSucess.insert(index, item);
  void updateListaDiarioSucessAtIndex(
          int index, Function(DiarioRow) updateFn) =>
      listaDiarioSucess[index] = updateFn(listaDiarioSucess[index]);

  PessoaRow? pessoaLogadaSucess;

  List<MaiorValorDiaStruct> listaMelhoresDiasSucess = [];
  void addToListaMelhoresDiasSucess(MaiorValorDiaStruct item) =>
      listaMelhoresDiasSucess.add(item);
  void removeFromListaMelhoresDiasSucess(MaiorValorDiaStruct item) =>
      listaMelhoresDiasSucess.remove(item);
  void removeAtIndexFromListaMelhoresDiasSucess(int index) =>
      listaMelhoresDiasSucess.removeAt(index);
  void insertAtIndexInListaMelhoresDiasSucess(
          int index, MaiorValorDiaStruct item) =>
      listaMelhoresDiasSucess.insert(index, item);
  void updateListaMelhoresDiasSucessAtIndex(
          int index, Function(MaiorValorDiaStruct) updateFn) =>
      listaMelhoresDiasSucess[index] = updateFn(listaMelhoresDiasSucess[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in PageSaveSucess widget.
  List<PessoaRow>? pessoa;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
