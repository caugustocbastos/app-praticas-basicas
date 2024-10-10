import '../database.dart';

class GrupoTable extends SupabaseTable<GrupoRow> {
  @override
  String get tableName => 'Grupo';

  @override
  GrupoRow createRow(Map<String, dynamic> data) => GrupoRow(data);
}

class GrupoRow extends SupabaseDataRow {
  GrupoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GrupoTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String get idcriador => getField<String>('idcriador')!;
  set idcriador(String value) => setField<String>('idcriador', value);
}
