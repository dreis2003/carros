import 'package:carros/componentes/drawer_list.dart';
import 'carros_listview.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: CarrosListView(),
      drawer: DrawerList(),
    );
  }
}
