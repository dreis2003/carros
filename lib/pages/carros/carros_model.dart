import 'package:carros/model/carro.dart';
import 'package:carros/services/carros_api.dart';
import 'package:mobx/mobx.dart';

part 'carros_model.g.dart';

class CarrosModel = CarrosModelBase with _$CarrosModel;

abstract class CarrosModelBase with Store {
  @observable
  List<Carro> carros;

  @observable
  Exception error;

  @action
  fetch(String tipo) async {
    try {
      this.error = null;
      this.carros = await CarrosApi.getCarros(tipo);
    } catch (e) {
      print("ERROR >>>>> $e");
      this.error = Exception(e);
      this.carros = [];
    }
  }
}
