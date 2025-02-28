import 'package:alejandra_cuaderno4/models/Producto.dart';

class LogicaProductos {
  static List<Producto> listaProductos = [];

  static List<Producto> getListaProductos() {
    return listaProductos;
  }

  static void anadirProducto(Producto producto) {
    listaProductos.add(producto);
  }

  static void editarProducto(int index, Producto productoActualizado) {
    if (index >= 0 && index < listaProductos.length) {
      listaProductos[index] = productoActualizado;
    }
  }

  static void eliminarProducto(int index) {
    if (index >= 0 && index < listaProductos.length) {
      listaProductos.removeAt(index);
    }
  }

  static void actualizarStock(String nombreProducto, int cantidadComprada) {
    for (var producto in listaProductos) {
      if (producto.nombre == nombreProducto && producto.stock >= cantidadComprada) {
        producto.stock -= cantidadComprada;
        break;
      }
    }
  }

  static void cargarProductosPorDefecto() {
    if (listaProductos.isEmpty) {
      listaProductos.addAll([
        Producto(
          nombre: "Laptop",
          descripcion: "Laptop potente con 16GB RAM",
          precio: 1200.0,
          stock: 10,
          imagen: "assets/images/laptop.png",
        ),
        Producto(
          nombre: "Mouse",
          descripcion: "Mouse inalámbrico ergonómico",
          precio: 25.0,
          stock: 50,
          imagen: "assets/images/mouse.png",
        ),
        Producto(
          nombre: "Teclado",
          descripcion: "Teclado mecánico RGB",
          precio: 75.0,
          stock: 30,
          imagen: "assets/images/teclado.png",
        ),
      ]);
    }
  }
}
