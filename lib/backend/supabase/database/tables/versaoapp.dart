import '../database.dart';

class VersaoappTable extends SupabaseTable<VersaoappRow> {
  @override
  String get tableName => 'versaoapp';

  @override
  VersaoappRow createRow(Map<String, dynamic> data) => VersaoappRow(data);
}

class VersaoappRow extends SupabaseDataRow {
  VersaoappRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VersaoappTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get versaoAtual => getField<String>('versao_atual');
  set versaoAtual(String? value) => setField<String>('versao_atual', value);

  String? get linkDownload => getField<String>('link_download');
  set linkDownload(String? value) => setField<String>('link_download', value);
}
