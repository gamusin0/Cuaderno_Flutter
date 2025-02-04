
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required this.title});


  final String title;

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Image.asset("assets/images/iconoPato.png"),
      )
    ); //hola
  }
}
