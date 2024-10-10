import '../database.dart';

class LiderancaTable extends SupabaseTable<LiderancaRow> {
  @override
  String get tableName => 'Lideranca';

  @override
  LiderancaRow createRow(Map<String, dynamic> data) => LiderancaRow(data);
}

class LiderancaRow extends SupabaseDataRow {
  LiderancaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LiderancaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get idpessoa => getField<String>('idpessoa')!;
  set idpessoa(String value) => setField<String>('idpessoa', value);

  String? get idunidade => getField<String>('idunidade');
  set idunidade(String? value) => setField<String>('idunidade', value);

  String? get idigreja => getField<String>('idigreja');
  set idigreja(String? value) => setField<String>('idigreja', value);

  bool get lider => getField<bool>('lider')!;
  set lider(bool value) => setField<bool>('lider', value);
}
