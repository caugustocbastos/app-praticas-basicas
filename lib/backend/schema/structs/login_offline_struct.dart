// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginOfflineStruct extends BaseStruct {
  LoginOfflineStruct({
    String? email,
    String? senha,
  })  : _email = email,
        _senha = senha;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "senha" field.
  String? _senha;
  String get senha => _senha ?? '';
  set senha(String? val) => _senha = val;

  bool hasSenha() => _senha != null;

  static LoginOfflineStruct fromMap(Map<String, dynamic> data) =>
      LoginOfflineStruct(
        email: data['email'] as String?,
        senha: data['senha'] as String?,
      );

  static LoginOfflineStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginOfflineStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'senha': _senha,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'senha': serializeParam(
          _senha,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoginOfflineStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginOfflineStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        senha: deserializeParam(
          data['senha'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoginOfflineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginOfflineStruct &&
        email == other.email &&
        senha == other.senha;
  }

  @override
  int get hashCode => const ListEquality().hash([email, senha]);
}

LoginOfflineStruct createLoginOfflineStruct({
  String? email,
  String? senha,
}) =>
    LoginOfflineStruct(
      email: email,
      senha: senha,
    );
