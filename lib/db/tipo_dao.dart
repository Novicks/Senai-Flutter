import 'package:projetoflutter/db/database_helper.dart';
import 'package:projetoflutter/tipo.dart';
class tipoDAO{
  static Future<List<Tipo>> listarTipos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_tipo');


    return resultado.map((mapa) {
      return Tipo(
        codigo: mapa['cd_tipo'] as int, // codigo
        nome: mapa ['nm_tipo'] as String // nome
      );
    }).toList();
  }
  static Future<Tipo> listar(int? id) async{
    final db = await DatabaseHelper.getDatabase();
    final result = await db.query('tb_tipo',
    where: 'cd_tipo = ?',
    whereArgs: [id]
    );
    return Tipo(
      codigo: result.first['cd_tipo'] as int,
      nome: result.first['nm_tipo'] as String
    );
  }
}