import 'dart:io';
import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/models/Usuario.dart';

class PantallaPerfil extends StatelessWidget {
  final Usuario usuario;

  const PantallaPerfil({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mi perfil'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 133, 192, 240)),
              child: Text('Menú'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mi perfil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Pantalla Principal'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Salir'),
              onTap: () {
                exit(0);
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nombre:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(usuario.nombre == "admin" ? "Admin" : usuario.nombre),
            const SizedBox(height: 10),
            const Text("Edad:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(usuario.nombre == "admin" ? "N/A" : usuario.edad),
            const SizedBox(height: 10),
            const Text("Lugar:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(usuario.nombre == "admin" ? "N/A" : usuario.lugar),
          ],
        ),
      ),
    );
  }
}
