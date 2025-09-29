import 'package:flutter/material.dart';

class telaCadRest extends StatelessWidget{
  telaCadRest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Informaçõe do restaurante", style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do restaurante'),
              validator: (String? value) {}
              // adicionar controller;
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Tipo de culinaria", style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 5),
            DropdownButtonFormField(value: null, decoration: InputDecoration(labelText: "Selecione uma opção.") ,items: [
              DropdownMenuItem(value: 'op1',child: Text('Japonesa')),
              DropdownMenuItem(value: 'op2',child: Text('Brasileira')),
              DropdownMenuItem(value: 'op3',child: Text('Tailândesa')),
            ], onChanged: (valor){print(valor);}),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Endereço", style: TextStyle(fontSize: 20))
            ),
            SizedBox(height: 5),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: TextFormField(
                  decoration: InputDecoration(hintText: 'Longitutde'),
                  validator: (String? value) {},
                )),
                Expanded(child: TextFormField(
                  decoration: InputDecoration(hintText: 'Latitude'),
                  validator: (String? value) {},
                ))
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: (){}, child: Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save),
                Text('Cadastrar')
              ],
            ))
          ],
        )
      )
    );
  }
}