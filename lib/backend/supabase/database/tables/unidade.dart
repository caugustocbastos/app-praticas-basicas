import '../database.dart';

class UnidadeTable extends SupabaseTable<UnidadeRow> {
  @override
  String get tableName => 'Unidade';

  @override
  UnidadeRow createRow(Map<String, dynamic> data) => UnidadeRow(data);
}

class UnidadeRow extends SupabaseDataRow {
  UnidadeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UnidadeTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  bool? get status => getField<bool>('Status');
  set status(bool? value) => setField<bool>('Status', value);

  String? get idIgreja => getField<String>('idIgreja');
  set idIgreja(String? value) => setField<String>('idIgreja', value);
}
