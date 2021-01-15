import 'package:carros/model/carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    final carros = List<Carro>();
    await Future.delayed(Duration(seconds: 2));
    carros.add(Carro(
        nome: "Lamborghini Reventon",
        urlFoto:
            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/luxo/Lamborghini_Reventon.png"));
    carros.add(Carro(
        nome: "Bugatti La Voiture Noire",
        urlFoto:
            "https://storage.googleapis.com/carros-flutterweb.appspot.com/scaled_20200824_002827.jpg"));
    carros.add(Carro(
        nome: "MacKenn",
        urlFoto:
            "https://storage.googleapis.com/carros-flutterweb.appspot.com/Mcqueen-3.png"));
    return carros;
  }
}
