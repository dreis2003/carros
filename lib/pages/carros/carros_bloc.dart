import 'package:carros/model/carro.dart';
import 'package:carros/services/carros_api.dart';
import 'package:carros/model/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}
