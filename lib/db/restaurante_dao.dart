import 'package:projetoflutter/db/usuario_dao.dart';

import 'database_helper.dart';
import 'package:projetoflutter/restaurante.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
      where:'cd_usuario = ?',
      whereArgs:[UsuarioDAO.usuarioLogado.codigo]
    );

    return resultado.map((mapa){
      return Restaurante(
       mapa['cd_restaurante'] as int,
        mapa['nm_restaurante'] as String
      );
    }).toList();
  }
  static Future<int> cadRest(String? nomeRest, String? latitude, String? longitude, int? tipo) async{
    final db = await  DatabaseHelper.getDatabase();
    final dadosRestaurante = {
      'nm_restaurante': nomeRest,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_tipo': tipo,
      'cd_usuario': UsuarioDAO.usuarioLogado.codigo
    };
    try{
      final idRest = await db.insert('tb_restaurante', dadosRestaurante);
      return idRest;
    } catch(e){
      print("Erro ao cadastrar restaurante: $e");
      return -1;
    }
  }
}