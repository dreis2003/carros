import 'package:carros/model/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/services/carros_api.dart';
import 'package:carros/model/simple_bloc.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    try {
      bool networkOn =  await isNetworkOn();
      print('networkOn >>> $networkOn' );
      if (! networkOn) {
        List<Carro> carros = await CarroDAO().findAllByTipo(tipo);
        add(carros);
        return carros;
      }
      List<Carro> carros = await CarrosApi.getCarros(tipo);

      if(carros.isNotEmpty) {
        final dao = CarroDAO();
        carros.forEach(dao.save); //salvar todos os carros no banco de dados
      }

      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
  }
}
