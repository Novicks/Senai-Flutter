import 'database_helper.dart';

class UsuarioDAO{
  static Future<bool> autenticar(String login, String senha) async{

    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query(
      'tb_usuario',
      where:'nm_login = ? and ds_senha = ?',
      whereArgs: [login, senha] // where args serve para colocar parametros no ?.
    );
    return resultado.isNotEmpty;
  }
}