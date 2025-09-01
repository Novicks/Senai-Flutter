import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{ // conexão com banco de dados
  static final _nomeBanco = "Solucao_Completa.db";
  static Database? _db;
  static Future<Database> getDatabase() async{
    if(_db != null){return _db!;}

    // espera encontar a pasta do banco dedos e verifica seo  caminho existe e onde se encontra
    Directory pastabanco = await getApplicationDocumentsDirectory();
    String caminho = join(pastabanco.path, _nomeBanco);

    if(!File(caminho).existsSync()){
      ByteData data = await rootBundle.load('assets/$_nomeBanco');
      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(caminho).writeAsBytes(bytes);
    }
    _db = await openDatabase(caminho);
    return _db!;
  }
}