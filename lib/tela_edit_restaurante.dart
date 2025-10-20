import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetoflutter/db/restaurante_dao.dart';
import 'package:projetoflutter/restaurante.dart';
import 'package:projetoflutter/db/tipo_dao.dart';
import 'package:projetoflutter/tipo.dart';

class telaEditRest extends StatefulWidget {
  static Restaurante rest = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return telaEditRestState();
  }
}
class telaEditRestState extends State<telaEditRest>{
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;
  int? codigo = telaEditRest.rest.codigo as int;

  List<Tipo> tipoDeCulinaria = [];
  int? tipoCulinaria;

  void initState(){
    super.initState();
    carregarTipos();
    nomeController.text = telaEditRest.rest.nome!;
    latitudeController.text = telaEditRest.rest.latitude.toString()!;
    longitudeController.text = telaEditRest.rest.longitude.toString()!;
    culinariaSelecionada = telaEditRest.rest.tipo?.nome!;
    tipoCulinaria = telaEditRest.rest.tipo?.codigo!;
  }

  Future<void> carregarTipos() async {
    final lista = await tipoDAO.listarTipos();
    // altera o estado da lista através do metodo setState()
    setState(() {
      tipoDeCulinaria = lista;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Edição de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Informações do Restaurante', style: TextStyle(fontSize: 18),),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Nome do Restaurante'),
            validator: (String? value){},
            controller: nomeController,
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Tipo de Culinaria'),
          ),
          DropdownButtonFormField<String>(
            value: culinariaSelecionada,
            items: tipoDeCulinaria.map((tipo){
              return DropdownMenuItem<String>(
                value: tipo.nome,
                child: Text('${tipo.nome}'),
              );
            }).toList(),
            onChanged: (String? culiSelecionada){
              setState(() {
                culinariaSelecionada = culiSelecionada;
              });
            },
          ),
          SizedBox(height: 15),
          Row(
            spacing: 20,
            children: [
              Expanded(child: TextFormField(
                decoration: InputDecoration(hintText: 'Longitude'),
                validator: (String? value) {},
                controller: latitudeController,
              )),
              Expanded(child: TextFormField(
                decoration: InputDecoration(hintText: 'Longitude'),
                validator: (String? value){
                  },
                controller: longitudeController,
              ))
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: ()async{
           final succes = await RestauranteDAO.atualizar(telaEditRest.rest.codigo, nomeController.text, latitudeController.text, longitudeController.text, tipoCulinaria);
           Navigator.pop(context);
          }, child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Salvar alterações'),
              Icon(Icons.save_as)
            ],
          ))
        ],
      ))
    );
  }
}
