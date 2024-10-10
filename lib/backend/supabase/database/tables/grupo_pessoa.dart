import '../database.dart';

class GrupoPessoaTable extends SupabaseTable<GrupoPessoaRow> {
  @override
  String get tableName => 'Grupo_Pessoa';

  @override
  GrupoPessoaRow createRow(Map<String, dynamic> data) => GrupoPessoaRow(data);
}

class GrupoPessoaRow extends SupabaseDataRow {
  GrupoPessoaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GrupoPessoaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get idgrupo => getField<String>('idgrupo')!;
  set idgrupo(String value) => setField<String>('idgrupo', value);

  String get idpessoa => getField<String>('idpessoa')!;
  set idpessoa(String value) => setField<String>('idpessoa', value);

  bool get lider => getField<bool>('lider')!;
  set lider(bool value) => setField<bool>('lider', value);
}
