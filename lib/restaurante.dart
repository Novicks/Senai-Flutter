import 'package:projetoflutter/tipo.dart';

class Restaurante{
  int? _codigo;
  String? _nome;
  String? _latitude;
  String? _longitude;
  Tipo? _tipo;
  // Construtor
  Restaurante({int? codigo, String? nome, String? latitude, String? longitude, Tipo? tipo}){
    _codigo = codigo;
    _nome = nome;
    _latitude = latitude;
    _longitude = longitude;
    _tipo = tipo;
  }

  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  Tipo? get tipo => _tipo;


  set codigo(int? codigo) => _codigo = codigo;
  set nome(String? nome) => _nome = nome;
  set latitude(String? latitude) => _latitude = latitude;
  set longitude(String? longitude) => _longitude = longitude;
}