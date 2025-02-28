class Pedido {
  int _id;
  String _usuario;
  String _estado;
  double _total;

  Pedido({
    required int id,
    required String usuario,
    required String estado,
    required double total,
  })  : _id = id,
        _usuario = usuario,
        _estado = estado,
        _total = total;

  // Getters
  int get id => _id;
  String get usuario => _usuario;
  String get estado => _estado;
  double get total => _total;

  // Setters
  set id(int id) {
    _id = id;
  }

  set usuario(String usuario) {
    _usuario = usuario;
  }

  set estado(String estado) {
    _estado = estado;
  }

  set total(double total) {
    if (total >= 0) {
      _total = total;
    }
  }
}
