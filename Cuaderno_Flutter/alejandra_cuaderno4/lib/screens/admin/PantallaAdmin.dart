// ignore_for_file: unused_element

import 'dart:io';

import 'package:alejandra_cuaderno4/screens/admin/GestionInventario.dart';
import 'package:alejandra_cuaderno4/screens/admin/GestionPedidos.dart';
import 'package:alejandra_cuaderno4/screens/admin/GestionProductos.dart';
import 'package:alejandra_cuaderno4/screens/login/PantallaInicioSesion.dart';
import 'package:flutter/material.dart';
import 'package:alejandra_cuaderno4/screens/admin/GestionUsuarios.dart';


class PantallaAdmin extends StatefulWidget {
  const PantallaAdmin({super.key});

  @override
  State<PantallaAdmin> createState() => _PantallaSecundaria();
}

class _PantallaSecundaria extends State<PantallaAdmin> {
  void _pantallaPrincipal() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PantallaInicioSesion()));
  }

  void _salir() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Administrador"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GestionUsuarios()));
              },
              label: const Text("Gestión de Usuarios"),
              icon: const Icon(Icons.people),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GestionProductos()));
              },
              label: const Text("Gestión de Productos"),
              icon: const Icon(Icons.shopping_bag),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GestionPedidos()));
              },
              label: const Text("Gestión de Pedidos"),
              icon: const Icon(Icons.shopping_cart),
             ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed:  () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GestionInventario()));
              },
              label: const Text("Gestión de Inventario"),
              icon: const Icon(Icons.inventory),
            ),
            const SizedBox(
              height: 30,
            ),
            
            SizedBox(height: 30,),
            
          ],
        ),
      ),
    );
  }
}