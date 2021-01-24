
import 'package:flutter/material.dart';
import 'package:carros/pages/login/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/pages/favoritos/db_helper.dart';
import 'package:carros/model/usuario.dart';
import 'package:carros/pages/home_page.dart';

class SplashPage  extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future a = DatabaseHelper.getInstance().db;
    
    Future b = Future.delayed(Duration(seconds: 3));

    Future<Usuario> c = Usuario.get();

    
    Future.wait([a, b, c]).then((List values) {
      Usuario user = values[2];
      print('user >> $user');
      if (user != null) {
            push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
   return Container(
     color: Colors.blue[200],
     child: Center(
       child: CircularProgressIndicator(),
     ),
   );
  }
}