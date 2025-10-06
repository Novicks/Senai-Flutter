import 'package:flutter/material.dart';
import 'package:projetoflutter/cad_restaurante.dart';
import 'package:projetoflutter/db/restaurante_dao.dart';
import 'package:projetoflutter/restaurante.dart';
import 'package:projetoflutter/tela_edit_restaurante.dart';
//StatelessWidget e estatico então quando compila o codigo vc não pode cria dinanismo nessa tela
//Ao usar StateFul devemos criar um construtor para a tela
class telaHome extends StatefulWidget {
  telaHome({super.key});

  @override
  State<telaHome> createState() => telaHomeState();
}


// cria construtor dinamico class => arrow fuction para nova class Construtor, adicionar class nova class exteds State <classe original>
class telaHomeState extends State<telaHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregaRestaurantes();
  }
  List<Restaurante> restaurantes = [];
  Future<void> carregaRestaurantes()async{
    final lista = await RestauranteDAO.listarTodos();
    setState((){
      restaurantes = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => telaCadRest()));
      }, child: Icon(Icons.add), backgroundColor: Colors.greenAccent,),
      appBar: AppBar(
          title: const Text("Lista de Restaurantes"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => telaCadRest()));
            }, icon: Icon(Icons.add))
          ],
      ),
      body: Padding(padding: const EdgeInsets.all(50),
          child: ListView.builder( // Não permite children
            itemCount: restaurantes.length, // numero de itens vira do banco de dados
            itemBuilder: (context, index){
              final r = restaurantes[index]; // faz o codigo percorrer um por um
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(r.nome ?? 'Sem nomee'),
                  subtitle: Text('ID: ${r.codigo}'),
                  trailing: Row( // Trailling coloca icones ou botoes um do lado do outro
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => telaEditRest()));
                      }, icon: Icon(Icons.edit), color: Colors.indigoAccent),
                      IconButton(onPressed: (){
                        AlertDialog(
                          title: Text("Confirmar ação"),
                          content: Text("Deseja realmente excluir?"),
                          actions: <Widget>[
                            TextButton(onPressed: (){
                              // código excluir registro
                            }, child: Text('Sim')),
                            TextButton(onPressed: (){

                            }, child: Text('nao'))
                          ],
                        );
                      }, icon: Icon(Icons.delete), color: Colors.redAccent)
                    ],
                  ),
                ),
              );
            },
          )
      )
    );
  }
            /* Exemplo de EXPANDED
                  Expanded(flex:4 ,child: Text("Cadastrar novo Restaurante")),
                  Expanded(flex:1,child: ElevatedButton(onPressed: (){
            */
}