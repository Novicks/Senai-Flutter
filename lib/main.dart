import 'package:flutter/material.dart';
import 'package:projetoflutter/usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    Usuario u = Usuario(
      1,
      "123",
      "Emerson123",
      "Emerson"
    );
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Dados top: "),
      ),
        body: Center(
          child: Padding(padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Nome: ${u.nome}"),
                Text("Código: ${u.codigo}"),
                Text("Login: ${u.login}"),
                Text("Senha: ${u.senha}")
              ],
            ),
          ),
        ),
      )
    );
  }
}
