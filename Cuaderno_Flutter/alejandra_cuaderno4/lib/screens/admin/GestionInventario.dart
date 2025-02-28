import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/logic/LogicaProductos.dart';
import 'package:alejandra_cuaderno4/models/Producto.dart';

class GestionInventario extends StatefulWidget {
  const GestionInventario({super.key});

  @override
  State<GestionInventario> createState() => _GestionInventarioState();
}

class _GestionInventarioState extends State<GestionInventario> {
  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  // Cargar productos por defecto
  void _cargarProductos() {
    if (LogicaProductos.getListaProductos().isEmpty) {
      LogicaProductos.anadirProducto(Producto(
          nombre: "Laptop",
          descripcion: "Laptop potente con 16GB RAM",
          precio: 1200.0,
          stock: 10,
          imagen: "assets/images/laptop.webp"));

      LogicaProductos.anadirProducto(Producto(
          nombre: "Mouse",
          descripcion: "Mouse inalámbrico ergonómico",
          precio: 25.0,
          stock: 50,
          imagen: "assets/images/mouse.png"));

      LogicaProductos.anadirProducto(Producto(
          nombre: "Teclado",
          descripcion: "Teclado mecánico RGB",
          precio: 75.0,
          stock: 30,
          imagen: "assets/images/teclado.webp"));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Producto> productos = LogicaProductos.getListaProductos();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Inventario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              child: productos.isNotEmpty
                  ? ListView.builder(
                      itemCount: productos.length,
                      itemBuilder: (context, index) {
                        Producto producto = productos[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: ListTile(
                            leading: Image.asset(
                              producto.imagen, 
                              width: 50, height: 50, fit: BoxFit.cover),
                            title: Text(producto.nombre),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Descripción: ${producto.descripcion}"),
                                Text("Precio: \$${producto.precio}"),
                                Text("Stock: ${producto.stock}"),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    // Función de editar (opcional)
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text("No hay productos registrados."),
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
}
