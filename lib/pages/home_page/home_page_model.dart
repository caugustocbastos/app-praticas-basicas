import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
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

  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<PessoaRow>? pessoa;
  // Stores action output result for [Backend Call - API (get lista maior valores dia)] action in ListTile widget.
  ApiCallResponse? resumoMelhoresDias;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
