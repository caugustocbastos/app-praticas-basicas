import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_loginStateOff')) {
        try {
          final serializedData = prefs.getString('ff_loginStateOff') ?? '{}';
          _loginStateOff = LoginOfflineStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<MaiorValorDiaStruct> _globlalMaiorValorDiaLista = [];
  List<MaiorValorDiaStruct> get globlalMaiorValorDiaLista =>
      _globlalMaiorValorDiaLista;
  set globlalMaiorValorDiaLista(List<MaiorValorDiaStruct> value) {
    _globlalMaiorValorDiaLista = value;
  }

  void addToGloblalMaiorValorDiaLista(MaiorValorDiaStruct value) {
    globlalMaiorValorDiaLista.add(value);
  }

  void removeFromGloblalMaiorValorDiaLista(MaiorValorDiaStruct value) {
    globlalMaiorValorDiaLista.remove(value);
  }

  void removeAtIndexFromGloblalMaiorValorDiaLista(int index) {
    globlalMaiorValorDiaLista.removeAt(index);
  }

  void updateGloblalMaiorValorDiaListaAtIndex(
    int index,
    MaiorValorDiaStruct Function(MaiorValorDiaStruct) updateFn,
  ) {
    globlalMaiorValorDiaLista[index] =
        updateFn(_globlalMaiorValorDiaLista[index]);
  }

  void insertAtIndexInGloblalMaiorValorDiaLista(
      int index, MaiorValorDiaStruct value) {
    globlalMaiorValorDiaLista.insert(index, value);
  }

  String _appVersao = '###';
  String get appVersao => _appVersao;
  set appVersao(String value) {
    _appVersao = value;
  }

  LoginOfflineStruct _loginStateOff =
      LoginOfflineStruct.fromSerializableMap(jsonDecode('{}'));
  LoginOfflineStruct get loginStateOff => _loginStateOff;
  set loginStateOff(LoginOfflineStruct value) {
    _loginStateOff = value;
    prefs.setString('ff_loginStateOff', value.serialize());
  }

  void updateLoginStateOffStruct(Function(LoginOfflineStruct) updateFn) {
    updateFn(_loginStateOff);
    prefs.setString('ff_loginStateOff', _loginStateOff.serialize());
  }

  final _consultaPessoaManager = FutureRequestManager<List<PessoaRow>>();
  Future<List<PessoaRow>> consultaPessoa({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PessoaRow>> Function() requestFn,
  }) =>
      _consultaPessoaManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearConsultaPessoaCache() => _consultaPessoaManager.clear();
  void clearConsultaPessoaCacheKey(String? uniqueKey) =>
      _consultaPessoaManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
