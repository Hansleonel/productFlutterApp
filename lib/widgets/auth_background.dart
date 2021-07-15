import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // podemos establecer el color de fondo del Widget Container()
      // con la propiedad "color" o tambien podemos modificar los valores de los colores globales del Theme de la application
      // color: Colors.red,
      // las sigueintes propieadades de nuestro Widget Container() nos permite establecer
      // las dimensiones de dicho widget, en este caso queremos que ocupe toda la pantalla
      // tanto en la propiedad "width" y "height" es por eso que denbemos de usar el valor de "double.infinity"
      width: double.infinity,
      height: double.infinity,
      // vemos que la propiedad "child" recibe el Widget Stack() dicho Widget nos permite
      // poner un Widget encima del otro
      child: Stack(
        children: [
          // como vemos el primer Widget de este stack sera el Widget _PurpleBox()
          // debemos de saber que tambien podemos modiciar la posicion de este Widget
          // con la propiedad alignment del Widget Stack()
          _PurpleBox()
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        // podemos usar la propiedad "color" para darle un color a todo el Widget Container()
        // o tambien podemos usar la propiedad "decoration" para darle una personalizacion mayor
        // en este caso usaremos el BoxDecoration
        //color: Colors.indigo);
        decoration: _purpleBoxDecorationBackground(),
        // como vemos dentro de nuestro Widget PurpleBox usaremos otro Widget Stack
        // es decir ubicaremos Widgets sobre este Widget
        child: Stack(
          children: [
            // como sabemos la propiedad children de nuestro Widget Stack() nos permite ubicar un Widget
            // encima de otro, en este caso ubicaremos varios Widgets parecidos con distitans ubicaciones
            // es por essto que debemos de usar el Widget Positioned que permite ubicar el Wigdet de manera
            // mas personalizada solo podemos usar el Widget Positioned() denntro de la propiedad "children" de un Stack()
            Positioned(
              child: _Bubble(),
              top: 90,
              left: 30,
            ),
            Positioned(
              child: _Bubble(),
              top: -40,
              left: -30,
            ),
            Positioned(
              child: _Bubble(),
              top: -50,
              right: -20,
            ),
            Positioned(
              child: _Bubble(),
              bottom: -50,
              left: 10,
            ),
            Positioned(
              child: _Bubble(),
              bottom: 120,
              right: 20,
            ),
          ],
        ));
  }

  // debemos de distinguir entre crear un metodo que nos devuelva un Widget como en este caso
  // y crear un Widget independiente y que maneje estados
  BoxDecoration _purpleBoxDecorationBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.07)),
    );
  }
}
