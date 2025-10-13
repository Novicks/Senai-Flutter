class Usuario{
  int? _codigo;
  String? _nome;
  String? _login;
  String? _senha;

  // Construtor
  Usuario({
    int? codigo,
    String? senha, String? login, String? nome}){
    _codigo = codigo;
    _senha = senha;
    _login = login;
    _nome = nome;
  }
  //Getters e Setters
  // exemplo tradicional de getter
  String? get login{
    return _login;
  }
  // metodo estilo dart
  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get senha => _senha;

  //setters
  //setters tradicional
  set login(String? login){
    _login = login;
  }
  //Setters estilo dart
  set nome(String? nome) => _nome = nome;
  set codigo (int? codigo) => _codigo = codigo;
  set senha(String? senha) => _senha = senha;
}


