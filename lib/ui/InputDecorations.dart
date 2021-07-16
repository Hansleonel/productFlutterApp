import 'package:flutter/material.dart';

// creando una clase InputDecorations para crear multiples metodos que manejen distintos tipos de InputDecoration
class InputDecorations {
  // creando un metodo estatico que recibira ciertos parametros para personalizar dicho InputDecorationn
  // recordemos que en el caso de los metodos debemos de pedir los parametros desde el llamado
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.deepPurple),
        prefixIcon:
            // condicion en caso exista, es decir si reciba un valor la propiedad "prefixIcon" que es del tipo IconData entonces
            // mostrar dicho IconData, en caso no exista, es decir no reciba ningun valor entonces no usar ningun IconData
            prefixIcon != null ? Icon(prefixIcon) : null);
  }
}
