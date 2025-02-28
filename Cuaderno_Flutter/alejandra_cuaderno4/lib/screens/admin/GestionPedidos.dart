import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/logic/LogicaPedidos.dart';
import 'package:alejandra_cuaderno4/models/Pedido.dart';

class GestionPedidos extends StatefulWidget {
  const GestionPedidos({super.key});

  @override
  State<GestionPedidos> createState() => _GestionPedidosState();
}

class _GestionPedidosState extends State<GestionPedidos> {
  @override
  Widget build(BuildContext context) {
    List<Pedido> pedidos = LogicaPedidos.getListaPedidos();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Pedidos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              child: pedidos.isNotEmpty
                  ? ListView.builder(
                      itemCount: pedidos.length,
                      itemBuilder: (context, index) {
                        Pedido pedido = pedidos[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(pedido.usuario[0].toUpperCase()),
                            ),
                            title: Text("Pedido #${pedido.id}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Usuario: ${pedido.usuario}"),
                                Text("Estado: ${pedido.estado}"),
                                Text("Total: \$${pedido.total.toStringAsFixed(2)}"),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _editarEstadoPedido(context, pedido, index),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text("No hay pedidos registrados."),
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }

  void _editarEstadoPedido(BuildContext context, Pedido pedido, int index) {
    List<String> estados = ["Pendiente", "En Producción", "En Reparto", "Entregado"];
    String nuevoEstado = pedido.estado;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cambiar Estado del Pedido"),
          content: DropdownButton<String>(
            value: nuevoEstado,
            items: estados.map((String estado) {
              return DropdownMenuItem<String>(
                value: estado,
                child: Text(estado),
              );
            }).toList(),
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  nuevoEstado = value;
                });
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  LogicaPedidos.actualizarEstadoPedido(index, nuevoEstado);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Estado del pedido #${pedido.id} actualizado a $nuevoEstado")),
                );

                Navigator.pop(context);
              },
              child: const Text("Guardar", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
