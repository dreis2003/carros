import 'package:carros/pages/carros/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

import 'package:carros/model/carro.dart';
import 'package:carros/pages/carros/carros_model.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  //List<Carro> carros;

  final _model = CarrosModel();

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    _model.fetch(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Observer(
      builder: (context) {
        List<Carro> carros = _model.carros;
        if (_model.error != null) {
          print("error >> $_model.error");
          return TextError(
            "Não foi possível buscar os carros \n\nClique aqui para tentar novamente.",
            onPressed: _fetch,
          );
        }
        if (carros == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return _listView(carros);
      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro carro = carros[index];
          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      carro.urlFoto ??
                          "https://pictures.dealer.com/fd-DIG_IMAGES/d9c6397b179023979ed7bde53eee05b4.jpg?w=640&impolicy=downsize&w=540",
                      width: 250,
                    ),
                  ),
                  Text(
                    carro.nome ?? "Sem nome",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "descrição...",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () => _onClickCarro(carro),
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _onClickCarro(Carro carro) {
    push(context, CarroPage(carro));
  }
}
