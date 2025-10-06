import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class telaEditRest extends StatelessWidget{
  telaEditRest({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Edição de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            spacing: 12,
            children: [
              Expanded(child: Text("Informações do restaurante"), flex: 3,),
              Expanded(child: Text("Tipo de culinaria"), flex: 2,)
            ],
          ),
          Row(
            spacing: 30,
            children: [
              Expanded(flex: 3,child: TextFormField(
                decoration: InputDecoration(hintText: 'nome do restaurante'),
                validator: (String? value) {},
              )),
              Expanded(flex: 2, child: DropdownButtonFormField(value: null, decoration: InputDecoration(labelText: "Selecione uma opção"), items: [
                DropdownMenuItem(value: 'op1', child: Text('Japonesa')),
                DropdownMenuItem(value: 'op2', child: Text('Brasileira')),
                DropdownMenuItem(value: 'op3', child: Text('Tailândesa')),
              ], onChanged: (valor){print(valor);},)
              )
            ],
          )
        ],
      )
      )
    );
  }
}
