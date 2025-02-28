class Producto {
  String _nombre;
  String _descripcion;
  double _precio;
  int _stock;
  String _imagen;

  Producto({
    required String nombre,
    required String descripcion,
    required double precio,
    required int stock,
    required String imagen,
  })  : _nombre = nombre,
        _descripcion = descripcion,
        _precio = precio,
        _stock = stock,
        _imagen = imagen;

  // Getters
  String get nombre => _nombre;
  String get descripcion => _descripcion;
  double get precio => _precio;
  int get stock => _stock;
  String get imagen => _imagen;

  // Setters
  set nombre(String nombre) {
    _nombre = nombre;
  }

  set descripcion(String descripcion) {
    _descripcion = descripcion;
  }

  set precio(double precio) {
    if (precio >= 0) {
      _precio = precio;
    }
  }

  set stock(int stock) {
    if (stock >= 0) {
      _stock = stock;
    }
  }

  set imagen(String imagen) {
    _imagen = imagen;
  }
}
