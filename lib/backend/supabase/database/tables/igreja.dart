import '../database.dart';

class IgrejaTable extends SupabaseTable<IgrejaRow> {
  @override
  String get tableName => 'Igreja';

  @override
  IgrejaRow createRow(Map<String, dynamic> data) => IgrejaRow(data);
}

class IgrejaRow extends SupabaseDataRow {
  IgrejaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IgrejaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  bool get status => getField<bool>('status')!;
  set status(bool value) => setField<bool>('status', value);
}
