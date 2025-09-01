import 'package:flutter/material.dart';

class telaHome extends StatelessWidget{
  telaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela inicial")),
      body: const Center(
        child: Text("Seja bem vindo"),
      ),
    );
  }
}