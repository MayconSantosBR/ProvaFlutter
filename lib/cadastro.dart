import 'package:flutter/material.dart';
import 'package:prova_vagner/main.dart';

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
      home: const Cadastro(title: 'Flutter Demo Home Page'),
    );
  }
}

class Cadastro extends StatefulWidget {
  const Cadastro({super.key, required this.title});
  final String title;

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  List<Widget> children = [];

  void _logar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(title: "teste")));
  }

  void _cadastrar(){
    setState(() {
      children.add(Text("Email: " + _emailController.value.text));
      children.add(Text("Nome: " + _nomeController.value.text));
      children.add(Text("Senha: " + _senhaController.value.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faça seu cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
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
                ElevatedButton(
                    onPressed: _cadastrar,
                    child: Text('Cadastro')
                ),
                ElevatedButton(
                  onPressed: _logar,
                  child: Text('Logar'),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children
            )
          ],
        ),
      ),
    );
  }
}
