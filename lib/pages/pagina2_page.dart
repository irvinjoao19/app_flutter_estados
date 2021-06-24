import 'package:flutter/material.dart';

import 'package:app_estados/models/usuario.dart';
import 'package:app_estados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioServices.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.requireData.nombre)
                : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = Usuario(
                    nombre: 'Irvin',
                    edad: 27,
                    profesiones: ['kotlin', 'flutter', 'java', 'dart']);
                usuarioServices.cargarUsuario(nuevoUsuario);
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioServices.cambiarEdad(30);
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
