// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> verificaErro(Future Function() acao) async {
  try {
    // Tenta executar a ação fornecida.
    await acao();
    return false; // Retorna false se a execução for bem-sucedida.
  } catch (e) {
    // Captura qualquer exceção e retorna true indicando que houve um erro.
    return true;
  }
}
