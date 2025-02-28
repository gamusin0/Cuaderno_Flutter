import 'package:alejandra_cuaderno4/logic/LogicaUsuarios.dart';
import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/screens/cliente/PantallaPrincipal.dart';
import 'package:alejandra_cuaderno4/screens/login/Registro.dart';
import 'package:alejandra_cuaderno4/models/Usuario.dart';
import 'package:alejandra_cuaderno4/screens/admin/PantallaAdmin.dart';

class PantallaInicioSesion extends StatefulWidget {
  const PantallaInicioSesion({super.key});

  @override
  State<PantallaInicioSesion> createState() => _PantallaInicioSesionState();
}

class _PantallaInicioSesionState extends State<PantallaInicioSesion> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  void iniciarSesion() {
    String usuario = usuarioController.text.trim();
    String contrasena = contrasenaController.text.trim();
    
    if (usuario == "admin" && contrasena == "admin") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PantallaAdmin()),
      );
      return;
    }

    Usuario? usuarioEncontrado = LogicaUsuarios.getListaUsuario().firstWhere(
      (u) => u.nombre == usuario && u.contrasena == contrasena,
      orElse: () => Usuario(nombre: "", contrasena: "", tratoSr: false, edad: "", lugar: ""),
    );

    if (usuarioEncontrado.nombre.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PantallaPrincipal(title: 'Pantalla Principal'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/iconoPato.png"),
              const SizedBox(height: 20),
              TextFormField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: contrasenaController,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Registro()),
                  );
                },
                child: const Text('Registrarse'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: iniciarSesion,
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
