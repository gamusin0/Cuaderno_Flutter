import 'package:alejandra_cuaderno4/models/Usuario.dart';

class LogicaUsuarios {
   static List<Usuario> listaUsuario = [];
  static Usuario? usuarioActual;

  static void anadirUsuario(Usuario usuario) {
    listaUsuario.add(usuario);
  }

  static List<Usuario> getListaUsuario() {
    return listaUsuario;
  }

  static void setUsuarioActual(Usuario usuario) {
    usuarioActual = usuario;
  }

  static Usuario? getUsuarioActual() {
    return usuarioActual;
  }
}
