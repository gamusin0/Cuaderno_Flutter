import 'package:alejandra_cuaderno4/models/Pedido.dart';

class LogicaPedidos {
  static List<Pedido> listaPedidos = [];


  static List<Pedido> getListaPedidos() {
    return listaPedidos;
  }


  static void anadirPedido(Pedido pedido) {
    listaPedidos.add(pedido);
  }

  static void actualizarEstadoPedido(int index, String nuevoEstado) {
    if (index >= 0 && index < listaPedidos.length) {
      listaPedidos[index].estado = nuevoEstado;
    }
  }

  static void eliminarPedido(int index) {
    if (index >= 0 && index < listaPedidos.length) {
      listaPedidos.removeAt(index);
    }
  }

  static void cargarPedidosPorDefecto() {
    if (listaPedidos.isEmpty) {
      listaPedidos.addAll([
        Pedido(id: 1, usuario: "Juan", estado: "Pendiente", total: 150.0),
        Pedido(id: 2, usuario: "Maria", estado: "En Producción", total: 75.0),
        Pedido(id: 3, usuario: "Carlos", estado: "En Reparto", total: 200.0),
      ]);
    }
  }
}
