import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  // como vemos cuando creamos el constructor de nuestro Widget AuthBackground()
  // y por las caracteristicas de Dart y el nullsafety debemos de estableces
  // como obligatorios u opcionales cada parametro recibido
  // en este caso el parametro key es opcional y el parametro child es obligatorio por la instruccion "required"
  const AuthBackground({Key? key, required this.child}) : super(key: key);

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
          _PurpleBox(),
          // necesitamos ubicar un Widget encima del Widget _PurpleBox()
          // en este caso el Widget sera el icono del login
          // recordemos que podemos usar un Widget SafeArea() para que no interrump el notch de algunos modelos de phones
          // y visualizar el Widget correctamente, ademas como vemos que la complejidad de este Widget esta creciendo
          // podemos extraerlo en otro Widget que vayamos a crear para visualizar el code de manera mas limpia y ordenada
          _HeaderIcon(),
          this.child
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // con la propiedad "width" podemos definr cuanto espacio debe de ocupar el Widget en este caso en el Widget Container()
        // pero la propiedad "child" que recibe un Widget tiene su propio size en este caso
        // el Widget Icon() tiene el size de 100 pero el Widget padre es decir el Widget Container() Ocupa todo el espacio
        // vertical posible puesto que su propiedad "width" recibe "double.infinity"
        width: double.infinity,
        // adicionalmente si queremos darle mas espacio que el que viene por defalt con el Widget SafeArea()
        // podemos utilizar la propiedad "margin" para darle un espaciado adicional
        margin: EdgeInsets.only(top: 24),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
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

  // debemos de distinguir entre crear un metodo para la logica de elementos complejos que no son Widgets
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
