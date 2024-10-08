import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BuscarMaiorValorNoIntervaloDiasCall {
  static Future<ApiCallResponse> call({
    int? dias,
    String? idPessoa = '',
    String? nomeColuna = '',
  }) async {
    final ffApiRequestBody = '''
{
  "input_dias": "${dias}",
  "input_idpessoa": "${idPessoa}",
  "input_nome_coluna": "${nomeColuna}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'buscar maior valor no  intervalo dias',
      apiUrl:
          'https://ryunukvapablhewsjmwb.supabase.co/rest/v1/rpc/get_maior_valor_dia',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5dW51a3ZhcGFibGhld3NqbXdiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NTU0NTksImV4cCI6MjAzNzIzMTQ1OX0.KSLigwZUBqG3Yl4OfTSKeZlPmFlLltU8-14Fnt_byJM',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResumoMelhoresPraticasCall {
  static Future<ApiCallResponse> call({
    String? idpessoa = '',
    int? ano,
    String? agrupamento = '',
  }) async {
    final ffApiRequestBody = '''
{
  "input_idpessoa": "${idpessoa}",
  "input_ano": "${ano}",
  "tipo_agrupamento": "${agrupamento}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resumoMelhoresPraticas',
      apiUrl:
          'https://ryunukvapablhewsjmwb.supabase.co/rest/v1/rpc/resumo_diario',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5dW51a3ZhcGFibGhld3NqbXdiIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcyMTY1NTQ1OSwiZXhwIjoyMDM3MjMxNDU5fQ.vB9HaAlcsidn2wlXJ62SOAllQKGBZRq1jOSHt5S7Z18',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
