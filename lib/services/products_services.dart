import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

// este clase extiende de ChangeNotifier() puesto que usaremos Provider como State Management
class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutterproducts-9fb3a-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  // constrcutor de nuestra clase ProductsService
  ProductsService() {
    this.loadProducts();
  }

  Future loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    // esperando la respuesta de nuestra API
    final resp = await http.get(url);

    // decodificando el valor de nuestra respuesta que debe de llegar el formato JSON
    // es por eso que solo accederemos al body de nuestra respuesta con ".body"
    final Map<String, dynamic> productsMap = json.decode(resp.body);

    // una vez decoficiada la repsuesta la imprimimos
    // recordemos que para que podamos usar el metodo loadProducts() debemos de realizar una instanciacion
    // en algun lugar de nuestra app, que como sabemos ya esta instanciada en la parte superior de nuestro arbol
    // de Widgets pero como tambien sabemos esa instanciacion se hace de forma "lazy" puesto que dentro de nuestro
    // Multiprovider y al momento de llamar a nuestro ChangeNotifierProvider dicho Widget se instancia con la propiedad
    // "lazy" en true, debemos de usar los provider solo en momentos adecuados, en este caso no es activar dicha provider
    // de manera automatica moficiand el valor de su propiedad "lazy" en false, puesto que queremos obtener los valores
    // de dichos productos unicamente si han pasado el login de manera correcta, es decir desde nuestro Screen HomeScreen()
    print(productsMap);

    // el ".forEach()" es un metodo predeterminado de las variables de tipo Map, nos permite recorrer
    // todo el mapa y manejar los valores de cada llave
    // en esrte caso la llave "key" para los dos elementos que tenemos en DB serian "abc123" y "xyz456"
    // y los valores "value" serian los json internos por ejemplo este es el primero"{available: true, name: PS5 controller, picture: https://cdn.idealo.com/folder/Product/200584/9/200584946/s11_produktbild_max/sony-dualsense-wireless-controller.jpg, price: 75.99}"
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      // almacenando dentro de la propiedad id el valor de las llaves, es decir "abc123" y "xyz456"
      tempProduct.id = key;
      // agregando objetos del tipo Product dentro de nuestra lista "products" del tipo Product
      this.products.add(tempProduct);
    });

    print(this.products[0].id);
  }
}
