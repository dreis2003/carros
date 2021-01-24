import 'package:carros/model/usuario.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:carros/model/carro.dart';

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipoCarro) async {
    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${user.token}",
    };

    print(headers);

    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipoCarro';

    print('>> $url');

    var response = await http.get(url, headers: headers);

    String json = response.body;
    print("status code: ${response.statusCode}");
    print(json);

    List list = convert.json.decode(json);

    final carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }
}
