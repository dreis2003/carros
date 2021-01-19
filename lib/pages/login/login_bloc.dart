import 'dart:async';
import 'package:carros/services/api_response.dart';
import 'package:carros/model/usuario.dart';
import 'package:carros/services/login_api.dart';
import 'package:carros/model/simple_bloc.dart';

class LoginBloc {
  final buttonBloc = SimpleBloc<bool>();

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    buttonBloc.add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    buttonBloc.add(false);

    return response;
  }

  void dispose() {
    buttonBloc.dispose();
  }
}
