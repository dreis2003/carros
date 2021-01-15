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
    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipoCarro';

    print('>> $url');

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    final carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    return carros;
  }
}
