import 'package:flutter/material.dart';
import 'package:projetoflutter/db/restaurante_dao.dart';
import 'package:projetoflutter/db/tipo_dao.dart';
import 'package:projetoflutter/tipo.dart';

class telaCadRest extends StatefulWidget {
  telaCadRest({super.key});
  // criando estado de acesso a tela
  @override
  State<StatefulWidget> createState() {
    return telaCadRestState();
  }
}
//
class telaCadRestState extends State<telaCadRest>{
// Cria elemetnos para controla os dados a serem recebidos
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  List<Tipo> tipoDeCulinaria = [];
  int? tipoCulinaria;
  String? culinariaSelecionada;

  void initState(){
    super.initState();
    carregarTipos();
  }

// cria uma ação assicrona para carregar os tipos puxando atráves da classe tipoDAO.
  Future<void> carregarTipos() async {
    final lista = await tipoDAO.listarTipos();
    // altera o estado da lista através do metodo setState()
    setState(() {
      tipoDeCulinaria = lista;
    });
  }

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
              validator: (String? value) {},
              controller: nomeController,
              // adicionar controller;
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Tipo de comida", style: TextStyle(fontSize: 20),),
            ),
            DropdownButtonFormField<String>(
                value: culinariaSelecionada,
                items: tipoDeCulinaria.map((tipo){
                  return DropdownMenuItem<String>(
                    value: tipo.nome,
                    child: Text('${tipo.nome}'),
                  );
                }).toList(),
                onChanged: (String? novaCulinaria){
                  setState(() {
                    culinariaSelecionada = novaCulinaria;
                    Tipo tipoSelecionado = tipoDeCulinaria.firstWhere(
                        (tipo) => tipo.nome == novaCulinaria,
                    );
                    tipoCulinaria = tipoSelecionado.codigo;
                  });
            }),
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
                  controller: longitudeController,
                )),
                Expanded(child: TextFormField(
                  decoration: InputDecoration(hintText: 'Latitude'),
                  validator: (String? value) {},
                  controller: latitudeController
                ))
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: ()async{
              final sucesso = await RestauranteDAO.cadRest(nomeController.text, latitudeController.text, longitudeController.text, tipoCulinaria);
                  String msg = 'ERRO: Restaurante não cadastrado.';
                  Color corFundo = Colors.red;
                  if(sucesso > 0){
                    msg = '${nomeController.text} cadastrado! ID $sucesso';
                    corFundo = Colors.green;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(msg),
                      backgroundColor: corFundo,
                      duration: Duration(seconds: 5),
                    )
                  );
            }, child: Row(
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