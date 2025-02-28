import 'package:alejandra_cuaderno4/models/Usuario.dart';
import 'package:alejandra_cuaderno4/screens/login/PantallaInicioSesion.dart';
import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/logic/LogicaUsuarios.dart'; 

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String? tratamiento = 'Sr';
  String valorin = 'Zaragoza';
  bool? check = false;

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController repetirContrasenaController = TextEditingController();
  final TextEditingController edadController = TextEditingController();

  final List<String> elementos = [
    'Zaragoza',
    'Huesca',
    'Teruel',
    'Tudela',
    'Fontellas, capital del mundo',
  ];

  void registrarUsuario() {
    String usuario = usuarioController.text.trim();
    String contrasena = contrasenaController.text.trim();
    String repetirContrasena = repetirContrasenaController.text.trim();
    String edad = edadController.text.trim();

    if (usuario.isEmpty || contrasena.isEmpty || repetirContrasena.isEmpty || edad.isEmpty) {
      mostrarMensaje("Todos los campos son obligatorios");
      return;
    }

    if (contrasena != repetirContrasena) {
      mostrarMensaje("Las contraseñas no coinciden");
      return;
    }

    if (check != true) {
      mostrarMensaje("Debe aceptar las condiciones");
      return;
    }


    LogicaUsuarios.anadirUsuario(
      Usuario(
        nombre: usuario,
        contrasena: contrasena,
        tratoSr: tratamiento == 'Sr',
        edad: edad,
        lugar: valorin,
      ),
    );

    mostrarMensaje("Usuario registrado correctamente");

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const PantallaInicioSesion(),
      ),
    );
  }

  void mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Formulario de Registro'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("Trato:"),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Sr'),
                      value: 'Sr',
                      groupValue: tratamiento,
                      onChanged: (value) {
                        setState(() {
                          tratamiento = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Sra'),
                      value: 'Sra',
                      groupValue: tratamiento,
                      onChanged: (value) {
                        setState(() {
                          tratamiento = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: usuarioController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: contrasenaController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: repetirContrasenaController,
                decoration: InputDecoration(
                  labelText: 'Repetir Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: edadController,
                decoration: InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: valorin,
                items: elementos.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    valorin = newValue.toString();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Lugar de nacimiento',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text('Aceptar las condiciones'),
                value: check,
                onChanged: (bool? newValue) {
                  setState(() {
                    check = newValue;
                  });
                },
              ),
              ElevatedButton(
                onPressed: registrarUsuario,
                child: const Text('Aceptar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

