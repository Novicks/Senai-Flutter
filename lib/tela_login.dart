import 'package:flutter/material.dart';
import 'package:projetoflutter/tela_home.dart';
import 'package:projetoflutter/usuario.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Usuario u = Usuario(1, '123Forte', 'AdmTop', 'Eu');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de login")),
      body: Padding(padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Digite o nome de usuario"),
              controller: usuarioController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              controller: senhaController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if (usuarioController.text == u.login && senhaController.text == u.senha){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => telaHome()));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Usuario ou senha digitado errado"))
                );
              }
            }, child: const Text('Logar'))
          ],
        ),
      )
    );
  }
}

