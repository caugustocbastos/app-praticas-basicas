// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaiorValorDiaStruct extends BaseStruct {
  MaiorValorDiaStruct({
    double? maiorValor,
    String? diaMes,
    String? nomeColuna,
  })  : _maiorValor = maiorValor,
        _diaMes = diaMes,
        _nomeColuna = nomeColuna;

  // "maior_valor" field.
  double? _maiorValor;
  double get maiorValor => _maiorValor ?? 0.0;
  set maiorValor(double? val) => _maiorValor = val;

  void incrementMaiorValor(double amount) => maiorValor = maiorValor + amount;

  bool hasMaiorValor() => _maiorValor != null;

  // "dia_mes" field.
  String? _diaMes;
  String get diaMes => _diaMes ?? '';
  set diaMes(String? val) => _diaMes = val;

  bool hasDiaMes() => _diaMes != null;

  // "nome_coluna" field.
  String? _nomeColuna;
  String get nomeColuna => _nomeColuna ?? '';
  set nomeColuna(String? val) => _nomeColuna = val;

  bool hasNomeColuna() => _nomeColuna != null;

  static MaiorValorDiaStruct fromMap(Map<String, dynamic> data) =>
      MaiorValorDiaStruct(
        maiorValor: castToType<double>(data['maior_valor']),
        diaMes: data['dia_mes'] as String?,
        nomeColuna: data['nome_coluna'] as String?,
      );

  static MaiorValorDiaStruct? maybeFromMap(dynamic data) => data is Map
      ? MaiorValorDiaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'maior_valor': _maiorValor,
        'dia_mes': _diaMes,
        'nome_coluna': _nomeColuna,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'maior_valor': serializeParam(
          _maiorValor,
          ParamType.double,
        ),
        'dia_mes': serializeParam(
          _diaMes,
          ParamType.String,
        ),
        'nome_coluna': serializeParam(
          _nomeColuna,
          ParamType.String,
        ),
      }.withoutNulls;

  static MaiorValorDiaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MaiorValorDiaStruct(
        maiorValor: deserializeParam(
          data['maior_valor'],
          ParamType.double,
          false,
        ),
        diaMes: deserializeParam(
          data['dia_mes'],
          ParamType.String,
          false,
        ),
        nomeColuna: deserializeParam(
          data['nome_coluna'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MaiorValorDiaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MaiorValorDiaStruct &&
        maiorValor == other.maiorValor &&
        diaMes == other.diaMes &&
        nomeColuna == other.nomeColuna;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([maiorValor, diaMes, nomeColuna]);
}

MaiorValorDiaStruct createMaiorValorDiaStruct({
  double? maiorValor,
  String? diaMes,
  String? nomeColuna,
}) =>
    MaiorValorDiaStruct(
      maiorValor: maiorValor,
      diaMes: diaMes,
      nomeColuna: nomeColuna,
    );
