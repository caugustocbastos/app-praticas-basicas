import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/editar_pratica_diaria_widget.dart';
import '/components/exibir_vazio_tabela_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'praticas_por_dia_widget.dart' show PraticasPorDiaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PraticasPorDiaModel extends FlutterFlowModel<PraticasPorDiaWidget> {
  ///  Local state fields for this page.

  List<MaiorValorDiaStruct> dataTypeMaioresValores = [];
  void addToDataTypeMaioresValores(MaiorValorDiaStruct item) =>
      dataTypeMaioresValores.add(item);
  void removeFromDataTypeMaioresValores(MaiorValorDiaStruct item) =>
      dataTypeMaioresValores.remove(item);
  void removeAtIndexFromDataTypeMaioresValores(int index) =>
      dataTypeMaioresValores.removeAt(index);
  void insertAtIndexInDataTypeMaioresValores(
          int index, MaiorValorDiaStruct item) =>
      dataTypeMaioresValores.insert(index, item);
  void updateDataTypeMaioresValoresAtIndex(
          int index, Function(MaiorValorDiaStruct) updateFn) =>
      dataTypeMaioresValores[index] = updateFn(dataTypeMaioresValores[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (get lista maior valores dia)] action in PraticasPorDia widget.
  ApiCallResponse? resumoMelhoresDias;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<DiarioRow>();
  // Stores action output result for [Backend Call - Delete Row(s)] action in Icon widget.
  List<DiarioRow>? praticaDeletada;
  Completer<List<DiarioRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (get lista maior valores dia)] action in Icon widget.
  ApiCallResponse? saidaApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
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
