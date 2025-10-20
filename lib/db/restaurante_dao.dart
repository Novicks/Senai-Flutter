import 'package:projetoflutter/db/tipo_dao.dart';
import 'package:projetoflutter/db/usuario_dao.dart';
import 'package:sqflite/sqflite.dart';

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
          codigo: mapa['cd_restaurante'] as int,
          nome: mapa['nm_restaurante'] as String
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
  static Future<void> deletarRest(Restaurante a) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.delete('tb_restaurante',
      where: 'cd_restaurante = ?',
      whereArgs: [a.codigo]
    );
  }
  static Future<Restaurante> listar(int? id) async{
    final db = await DatabaseHelper.getDatabase();
    final result = await db.query('tb_restaurante',
    where: 'cd_restaurante = ?',
      whereArgs: [id]
    );

    return Restaurante(
      codigo: result.first['cd_restaurante'] as int,
      nome: result.first['nm_restaurante'] as String,
      latitude: result.first['latitude_restaurante'] as String,
      longitude: result.first['longitude_restaurante'] as String,
      tipo: await tipoDAO.listar(result.first['cd_tipo'] as int)
    );
  }
  static Future<void> atualizar(
      int? cd,
      String? nome,
      String? latitude,
      String? longitude,
      int? tipo
      ) async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.update('tb_restaurante', {
          'nm_restaurante' : nome,
          'latitude_restaurante' : latitude,
          'longitude_restaurante' : longitude,
          'cd_tipo' : tipo
        },
        where: 'cd_restaurante = ?',
        whereArgs:  [cd]
    );

  }
}