import '../database.dart';

class DiarioResumoSemanalTable extends SupabaseTable<DiarioResumoSemanalRow> {
  @override
  String get tableName => 'DiarioResumoSemanal';

  @override
  DiarioResumoSemanalRow createRow(Map<String, dynamic> data) =>
      DiarioResumoSemanalRow(data);
}

class DiarioResumoSemanalRow extends SupabaseDataRow {
  DiarioResumoSemanalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiarioResumoSemanalTable();

  String? get idPessoa => getField<String>('idPessoa');
  set idPessoa(String? value) => setField<String>('idPessoa', value);

  int? get semana => getField<int>('semana');
  set semana(int? value) => setField<int>('semana', value);

  int? get mes => getField<int>('mes');
  set mes(int? value) => setField<int>('mes', value);

  int? get ano => getField<int>('ano');
  set ano(int? value) => setField<int>('ano', value);

  String? get periodoSemana => getField<String>('periodoSemana');
  set periodoSemana(String? value) => setField<String>('periodoSemana', value);

  double? get johrei => getField<double>('johrei');
  set johrei(double? value) => setField<double>('johrei', value);

  double? get ensinamento => getField<double>('ensinamento');
  set ensinamento(double? value) => setField<double>('ensinamento', value);

  double? get donativo => getField<double>('donativo');
  set donativo(double? value) => setField<double>('donativo', value);

  double? get dedicacao => getField<double>('dedicacao');
  set dedicacao(double? value) => setField<double>('dedicacao', value);

  double? get encaminhamento => getField<double>('encaminhamento');
  set encaminhamento(double? value) =>
      setField<double>('encaminhamento', value);

  double? get oracao => getField<double>('oracao');
  set oracao(double? value) => setField<double>('oracao', value);

  int? get relato => getField<int>('relato');
  set relato(int? value) => setField<int>('relato', value);
}
