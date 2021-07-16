import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // como vemos queremos manejar los valores inseratados en este Screen, es decir LoginScreen()
        // pero necesimos ubicar el Widget que manejara dichos valores dentro de nuestro Widget AuthBackground()
        // es por eso que necesitamos enviarle un Widget como parametro a nuestro Widget AuthBackground
        body: AuthBackground(
      child: Container(),
    ));
  }
}
