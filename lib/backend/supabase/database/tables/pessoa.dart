import '../database.dart';

class PessoaTable extends SupabaseTable<PessoaRow> {
  @override
  String get tableName => 'Pessoa';

  @override
  PessoaRow createRow(Map<String, dynamic> data) => PessoaRow(data);
}

class PessoaRow extends SupabaseDataRow {
  PessoaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PessoaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idUsuario => getField<String>('idUsuario');
  set idUsuario(String? value) => setField<String>('idUsuario', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  String? get idUnidade => getField<String>('idUnidade');
  set idUnidade(String? value) => setField<String>('idUnidade', value);
}
