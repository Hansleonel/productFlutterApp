import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginScreen(),
        'home': (BuildContext context) => HomeScreen()
      },
      theme:
          // modificando solo el valor global de el color de fondo de los Scaffolds dentro de la application
          // con el uso del el ThemeData
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
