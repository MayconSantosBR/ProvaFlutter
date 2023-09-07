import 'package:flutter/material.dart';
import 'package:prova_vagner/cadastro.dart';
import 'package:prova_vagner/calculadora.dart';

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
      home: const Homepage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});
  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  void _logar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Calculadora(title: "teste")));
  }

  void _cadastrar(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro(title: "teste")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo(a)! Faça cadastro ou login.'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Login',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true, // Hide the entered text for passwords
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _cadastrar,
                    child: Text('Cadastro')
                ),
                ElevatedButton(
                  onPressed: _logar,
                  child: Text('Logar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
