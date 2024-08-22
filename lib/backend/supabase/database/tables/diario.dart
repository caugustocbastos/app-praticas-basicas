import '../database.dart';

class DiarioTable extends SupabaseTable<DiarioRow> {
  @override
  String get tableName => 'Diario';

  @override
  DiarioRow createRow(Map<String, dynamic> data) => DiarioRow(data);
}

class DiarioRow extends SupabaseDataRow {
  DiarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiarioTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get idPessoa => getField<String>('idPessoa')!;
  set idPessoa(String value) => setField<String>('idPessoa', value);

  DateTime get dataField => getField<DateTime>('data')!;
  set dataField(DateTime value) => setField<DateTime>('data', value);

  double get johrei => getField<double>('johrei')!;
  set johrei(double value) => setField<double>('johrei', value);

  double get ensinamento => getField<double>('ensinamento')!;
  set ensinamento(double value) => setField<double>('ensinamento', value);

  double get donativo => getField<double>('donativo')!;
  set donativo(double value) => setField<double>('donativo', value);

  double get dedicacao => getField<double>('dedicacao')!;
  set dedicacao(double value) => setField<double>('dedicacao', value);

  double get encaminhamento => getField<double>('encaminhamento')!;
  set encaminhamento(double value) => setField<double>('encaminhamento', value);

  String? get relato => getField<String>('relato');
  set relato(String? value) => setField<String>('relato', value);

  int get semana => getField<int>('semana')!;
  set semana(int value) => setField<int>('semana', value);

  int get mes => getField<int>('mes')!;
  set mes(int value) => setField<int>('mes', value);

  int get ano => getField<int>('ano')!;
  set ano(int value) => setField<int>('ano', value);

  double get oracao => getField<double>('oracao')!;
  set oracao(double value) => setField<double>('oracao', value);
}
