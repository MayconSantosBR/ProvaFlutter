import 'package:flutter/material.dart';
import 'package:prova_vagner/calculadora.dart';
import 'package:prova_vagner/logo.dart';
import 'package:prova_vagner/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogoPage(),
    );
  }
}

class LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo'),
      ),
      drawer: Drawer(
        // The menu (sandwich menu) on the left side
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Calculadora'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Calculadora(title: "teste")));
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(title: "teste")));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Image.asset('logo.png'),
      ),
    );
  }
}