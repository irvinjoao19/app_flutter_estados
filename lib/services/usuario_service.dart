import 'dart:async';

import 'package:app_estados/models/usuario.dart';

class _UsuarioServices {
  Usuario? _usuario;

  StreamController<Usuario> _usuarioStreamController =
      new StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario!;
  bool get existeUsuario => (this._usuario != null) ? true : false;
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    if (this.existeUsuario) {
      this._usuario!.edad = edad;
      this._usuarioStreamController.add(this._usuario!);
    }
  }

  dispose() {
    this._usuarioStreamController.close();
  }
}

final usuarioServices = new _UsuarioServices();
