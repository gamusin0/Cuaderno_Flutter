import 'dart:io';
import 'package:alejandra_cuaderno4/logic/LogicaUsuarios.dart';
import 'package:alejandra_cuaderno4/models/Usuario.dart';
import 'package:alejandra_cuaderno4/screens/cliente/PantallaPerfil.dart';
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required String title});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  @override
  Widget build(BuildContext context) {
    setState(() {}); 
    Usuario? usuarioActual = LogicaUsuarios.getUsuarioActual();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pantalla Principal'),

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 133, 192, 240)),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color.fromARGB(255, 133, 192, 240)),
                accountName: Text(
                  usuarioActual != null ? usuarioActual.nombre : "Usuario no autenticado",
                  style: const TextStyle(fontSize: 18),
                ),
                accountEmail: const Text(""),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    usuarioActual != null ? usuarioActual.nombre[0].toUpperCase() : "?",
                    style: const TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mi perfil'),
              onTap: () {
                setState(() {
                  usuarioActual = LogicaUsuarios.getUsuarioActual();
                });
                if (usuarioActual != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PantallaPerfil(usuario: usuarioActual!)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No hay usuario autenticado")),
                  );
                }
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
    );
  }
}

