import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // como vemos con el Widget Multiprovider podemos acceder a multiples Providers que extienden de ChangeNotifier
    // si quisiera usar solo un ChangeNotifier, deberemos de devolvr solo el Widget ChangeNotifier()
    // ademas por instanciar el Multiprovider en nuestro Main() poderemos acceder a estos providers desde cualquier parte de nuestra
    // aplicacion, puesto que esta en la parte mas alta de nuestro arbol de Widgets
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => ProductsService())
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Productos App',
        initialRoute: 'home',
        routes: {
          'login': (BuildContext context) => LoginScreen(),
          'home': (BuildContext context) => HomeScreen(),
          'product': (BuildContext context) => ProducScreen()
        },
        theme:
            // modificando solo el valor global de el color de fondo de los Scaffolds dentro de la application
            // con el uso del el ThemeData
            ThemeData.light().copyWith(
                scaffoldBackgroundColor: Colors.grey[300],
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  color: Colors.indigo,
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.indigo, elevation: 0)));
  }
}
