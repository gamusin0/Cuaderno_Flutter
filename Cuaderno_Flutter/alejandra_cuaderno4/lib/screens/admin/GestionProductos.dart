import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/logic/LogicaProductos.dart';
import 'package:alejandra_cuaderno4/models/Producto.dart';

class GestionProductos extends StatefulWidget {
  const GestionProductos({super.key});

  @override
  State<GestionProductos> createState() => _GestionProductosState();
}

class _GestionProductosState extends State<GestionProductos> {
  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

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

  void _eliminarProducto(int index) {
    setState(() {
      LogicaProductos.getListaProductos().removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Producto eliminado correctamente")),
    );
  }

  void _editarProducto(BuildContext context, Producto producto, int index) {
    TextEditingController nombreController =
        TextEditingController(text: producto.nombre);
    TextEditingController descripcionController =
        TextEditingController(text: producto.descripcion);
    TextEditingController precioController =
        TextEditingController(text: producto.precio.toString());
    TextEditingController stockController =
        TextEditingController(text: producto.stock.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Editar Producto"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: descripcionController,
                decoration: const InputDecoration(labelText: "Descripción"),
              ),
              TextField(
                controller: precioController,
                decoration: const InputDecoration(labelText: "Precio"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: stockController,
                decoration: const InputDecoration(labelText: "Stock"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  producto.nombre = nombreController.text;
                  producto.descripcion = descripcionController.text;
                  producto.precio = double.tryParse(precioController.text) ?? producto.precio;
                  producto.stock = int.tryParse(stockController.text) ?? producto.stock;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${producto.nombre} ha sido actualizado")),
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

  void _agregarProducto(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController descripcionController = TextEditingController();
    TextEditingController precioController = TextEditingController();
    TextEditingController stockController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Nuevo Producto"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: descripcionController,
                decoration: const InputDecoration(labelText: "Descripción"),
              ),
              TextField(
                controller: precioController,
                decoration: const InputDecoration(labelText: "Precio"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: stockController,
                decoration: const InputDecoration(labelText: "Stock"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  LogicaProductos.anadirProducto(Producto(
                    nombre: nombreController.text,
                    descripcion: descripcionController.text,
                    precio: double.tryParse(precioController.text) ?? 0.0,
                    stock: int.tryParse(stockController.text) ?? 0,
                    imagen: "assets/images/default.png",
                  ));
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Producto agregado correctamente")),
                );
                Navigator.pop(context);
              },
              child: const Text("Agregar", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Producto> productos = LogicaProductos.getListaProductos();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Productos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _agregarProducto(context),
              child: const Text("Añadir Producto"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  Producto producto = productos[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: Image.asset(producto.imagen, width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(producto.nombre),
                      subtitle: Text("Precio: \$${producto.precio} | Stock: ${producto.stock}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editarProducto(context, producto, index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _eliminarProducto(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
