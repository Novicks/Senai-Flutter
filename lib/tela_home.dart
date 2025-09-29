import 'package:flutter/material.dart';
import 'package:projetoflutter/cad_restaurante.dart';

class telaHome extends StatelessWidget{
  telaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela inicial")),
      body: Padding(padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Lista de Restaurantes:"),
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => telaCadRest()));
              }, child: Text("Cadastrar Novo Restaurante")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children:[
                      Text("Meu Restaurante"),
                      Text("Comida Mexicana")
                    ],
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: (){

                  }, child: Text("Excluir")),
                  ElevatedButton(onPressed: (){}, child: Text("Editar"))
                ],
              )
            ],
          ),
        ),
    );
  }
}