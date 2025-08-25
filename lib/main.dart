import 'package:flutter/material.dart';
import 'package:projetoflutter/tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    /*Usuario u = Usuario(
      1,
      "123",
      "Emerson123",
      "Emerson"
    );*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin()
    );
  }
}
