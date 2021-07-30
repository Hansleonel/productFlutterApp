import 'dart:convert';

class Product {
  // propiedades de nuestra clase Product
  String? id;
  bool available;
  String name;
  String? picture;
  double price;

  // constructor de nuestra clase Product
  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
  });

  // metodo ".fromJson(str)" que recibe un parametro "str", dentro de dicho metodo ".fromJson(str)"
  // usamos un metodo adicional de nombre ".fromMap()" que como vemos antes de recibir su variable decodifica el parametro recibido con el nombre de "str"
  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  // TODO este metodo nos sirve para codigoficar los valores que queramos enviar al servidor
  // puesto que los envios debemos de hacerlos en forma de JSON
  String toJson() => json.encode(toMap());

  // metodo ".fromMap(Map<String, dynamic> json)" que como vemos recibe el parametro "str" pero ya DECODIFICADO
  // es decir recibe el Map de nombre "json", dicha variable es la resultante de dicha decodificacion en su llamado
  // dentro del metodo ".fromJson()", que como vemos llama a este metodo de nombre ".fromMap()"
  // TODO este metodo le da valores a las propieades de nuestra clase Product()
  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json['available'],
        name: json['name'],
        picture: json['picture'],
        price: json['price'].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };
}
