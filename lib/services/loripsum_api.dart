import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:carros/model/simple_bloc.dart';

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = "https://loripsum.net/api";

    print("GET > $url");

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");

    return text;
  }
}

class LoripsumABloc extends SimpleBloc<String> {
  static String lorim;
  final _streamController = StreamController<String>();
  fetch() async {
    try {
      String retorno = lorim ?? await LoripsumApi.getLoripsum();
      lorim = retorno;
      add(retorno);
    } catch (e) {
      addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
