import 'package:flutter/material.dart';
import 'package:projetoflutter/db/usuario_dao.dart';
import 'package:projetoflutter/tela_home.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  //Usuario u = Usuario(1, '123Forte', 'AdmTop', 'Eu');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(padding: const EdgeInsets.all(60.0),
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
            Column(
              children: [
                ElevatedButton(onPressed: () async{
                  final sucesso = await UsuarioDAO.autenticar(usuarioController.text, senhaController.text);
                  if (sucesso){
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => telaHome()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Usuario ou senha digitado errado"))
                    );
                  }
                }, child: Row(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Logar')
                  ],
                ),
                )
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                    RichText(text: TextSpan(children: <TextSpan>[
                      TextSpan(text: 'Não tem conta?    ', style: TextStyle(color: Colors.black, fontSize: 15)),
                      TextSpan(text: 'Cadastrar-se!', style: TextStyle(color: Colors.indigoAccent, fontSize: 15)
                      )
                    ]))
                )

              ],
            )
          ],
        ),
      )
    );
  }
}

