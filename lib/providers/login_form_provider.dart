import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // el GlobalKey es una referencia unica a un Widget especifico
  // en este caso la referencia se hara al widget Form()
  GlobalKey<FormState> formKeyUnique = new GlobalKey<FormState>();
  // propiedades que almacenaran los valores de los widgets que vayamos a necesitar para hacer el login
  String email = '';
  String password = '';

  // propiedad de la cual si depende la modificacion de la interfaz de uno o varios elementos en el arbol de Widgets
  // en este caso la interfaz de el Widget MaterialButton()
  bool _isLoading = false;

  // creando su getter para obtener el valor de la propieadad _isLoading
  // es por eso que hace un retrn del valor de dicha propiedad _isLoading
  get getIsLoading {
    return _isLoading;
  }

  // creando su setter para establecer un valor dentro de la propiedad _isLoading con el valor recibido de "valorIsLoading"
  // ademas utilizamos un "notifyListener()" para que todos los Widgets que esten escuchando ese provider
  // en este caso solo es el Widget _LoginForm() actualicen su interfaz
  set setIsLoading(bool valorIsLoading) {
    _isLoading = valorIsLoading;
    notifyListeners();
  }

  // metodo para realizar las validaciones de forma multiple desde un mismo llamado
  // en este caso cuando se use el Widget MaterialButton()
  bool isValidForm() {
    // usando el metodo ".validate()" que solo puede ser usado cuando el GlobalKey en este caso "formKeyUnique"
    // es del tipo FormState es decir solo para Widgets Form()
    bool? valor = formKeyUnique.currentState?.validate();
    print('valor : $valor, email : $email, password : $password');

    return valor ?? false;
  }
}
