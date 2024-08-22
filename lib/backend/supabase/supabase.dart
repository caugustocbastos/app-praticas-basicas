import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://ryunukvapablhewsjmwb.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5dW51a3ZhcGFibGhld3NqbXdiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NTU0NTksImV4cCI6MjAzNzIzMTQ1OX0.KSLigwZUBqG3Yl4OfTSKeZlPmFlLltU8-14Fnt_byJM';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
