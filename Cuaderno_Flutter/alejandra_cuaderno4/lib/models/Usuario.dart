class Usuario {
  String _nombre;
  String _contrasena;
  bool _tratoSr;
  String _edad;
  String _lugar;

  Usuario({
    required String nombre,
    required String contrasena,
    required bool tratoSr,
    required String edad,
    required String lugar,
  })  : _nombre = nombre,
        _contrasena = contrasena,
        _tratoSr = tratoSr,
        _edad = edad,
        _lugar = lugar;

  String get nombre => _nombre;
  String get contrasena => _contrasena;
  bool get tratoSr => _tratoSr;
  String get edad => _edad;
  String get lugar => _lugar;


  set nombre(String nombre) {
    _nombre = nombre;
  }

  set contrasena(String contrasena) {
    _contrasena = contrasena;
  }

  set tratoSr(bool tratoSr) {
    _tratoSr = tratoSr;
  }

  set edad(String edad) {
    _edad = edad;
  }

  set lugar(String lugar) {
    _lugar = lugar;
  }
}