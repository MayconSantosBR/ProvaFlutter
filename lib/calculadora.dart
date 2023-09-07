import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';
import 'package:prova_vagner/main.dart';

import 'logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculadora(title: 'Flutter Demo Home Page'),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});
  final String title;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _inputController = TextEditingController();

  void _adicionaNumero(String value){
    setState(() {
      _inputController.text += value.toString();
    });
  }

  void _realizaCalculo(){
    Expression exp = Expression(_inputController.value.text);

    setState(() {
      _inputController.text = exp.eval().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
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
              title: Text('Logo'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogoPage()));
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Homepage(title: "teste")));
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 170,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.grey,
                child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      enabled: true,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("-"),
                          child: Text("-"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("7"),
                          child: Text("7"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("4"),
                          child: Text("4"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("1"),
                          child: Text("1"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("0"),
                          child: Text("0"),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("+"),
                          child: Text("+"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("8"),
                          child: Text("8"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("5"),
                          child: Text("5"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("2"),
                          child: Text("2"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("*"),
                          child: Text("*"),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("/"),
                          child: Text("/"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("9"),
                          child: Text("9"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("6"),
                          child: Text("6"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _adicionaNumero("3"),
                          child: Text("3"),
                        ),
                        FloatingActionButton(
                          onPressed: () => _realizaCalculo(),
                          child: Text("Enter"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
