import 'package:projetoflutter/db/database_helper.dart';
import 'package:projetoflutter/tipo.dart';
class tipoDAO{
  static Future<List<Tipo>> listarTipos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_tipo');


    return resultado.map((mapa) {
      return Tipo(
        mapa['cd_tipo'] as int, // codigo
        mapa ['nm_tipo'] as String // nome
      );
    }).toList();
  }
}