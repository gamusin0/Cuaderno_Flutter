import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/logic/LogicaUsuarios.dart';
import 'package:alejandra_cuaderno4/models/Usuario.dart';

class GestionUsuarios extends StatefulWidget {
  const GestionUsuarios({super.key});

  @override
  State<GestionUsuarios> createState() => _GestionUsuariosState();
}

class _GestionUsuariosState extends State<GestionUsuarios> {
  @override
  void initState() {
    super.initState();
    _cargarUsuarios();
  }

  void _cargarUsuarios() {
    if (LogicaUsuarios.getListaUsuario().isEmpty) {
      LogicaUsuarios.anadirUsuario(Usuario(
        nombre: "admin",
        contrasena: "admin",
        tratoSr: false,
        edad: "N/A",
        lugar: "N/A",
      ));

      LogicaUsuarios.anadirUsuario(Usuario(
        nombre: "Juan",
        contrasena: "juan",
        tratoSr: true,
        edad: "25",
        lugar: "Madrid",
      ));

      LogicaUsuarios.anadirUsuario(Usuario(
        nombre: "Maria",
        contrasena: "maria",
        tratoSr: false,
        edad: "30",
        lugar: "Barcelona",
      ));

      LogicaUsuarios.anadirUsuario(Usuario(
        nombre: "Carlos",
        contrasena: "carlos",
        tratoSr: true,
        edad: "28",
        lugar: "Valencia",
      ));
    }
  }

  void _eliminarUsuario(int index) {
    setState(() {
      LogicaUsuarios.getListaUsuario().removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usuario eliminado correctamente")),
    );
  }

  void _bloquearUsuario(BuildContext context, Usuario usuario, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Bloquear Usuario"),
          content: Text("¿Seguro que deseas bloquear a ${usuario.nombre}?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${usuario.nombre} ha sido bloqueado")),
                );
                Navigator.pop(context);
              },
              child: const Text("Bloquear", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _editarUsuario(BuildContext context, Usuario usuario, int index) {
    TextEditingController nombreController =
        TextEditingController(text: usuario.nombre);
    TextEditingController edadController =
        TextEditingController(text: usuario.edad);
    TextEditingController lugarController =
        TextEditingController(text: usuario.lugar);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Editar Usuario"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: edadController,
                decoration: const InputDecoration(labelText: "Edad"),
              ),
              TextField(
                controller: lugarController,
                decoration: const InputDecoration(labelText: "Lugar"),
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
                  usuario.nombre = nombreController.text;
                  usuario.edad = edadController.text;
                  usuario.lugar = lugarController.text;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${usuario.nombre} ha sido actualizado")),
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

  @override
  Widget build(BuildContext context) {
    List<Usuario> usuarios = LogicaUsuarios.getListaUsuario()
        .where((u) => u.nombre != "admin") // Excluir admin
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Gestión de Usuarios"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  Usuario usuario = usuarios[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(usuario.nombre[0].toUpperCase()),
                      ),
                      title: Text(usuario.nombre),
                      subtitle: Text("Edad: ${usuario.edad} | Lugar: ${usuario.lugar}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editarUsuario(context, usuario, index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.block, color: Colors.orange),
                            onPressed: () => _bloquearUsuario(context, usuario, index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _eliminarUsuario(index),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
