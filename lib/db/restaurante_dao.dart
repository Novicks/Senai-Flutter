import 'database_helper.dart';
import 'package:projetoflutter/restaurante.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante');

    return resultado.map((mapa){
      return Restaurante(
       mapa['cd_restaurante'] as int,
        mapa['nm_restaurante'] as String
      );
    }).toList();
  }
}