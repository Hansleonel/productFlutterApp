import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // cuando hacemos el llamado a nuestro Provider ProducstServices
    // estaremos utilizando la instancia creada con nuestro Multiprovider en la parte superior en nuestro arbol de Widgets
    // es por eso que en ese momento el valor de la propiedad "lazy" del ChangeNotifierProvider se modifica
    // para ser un true, es decir se dispara el constructor de nuestro ProductsServices
    // que como sabemos tiene la peticion http a nuestra API dentro del metodo "loadProducts()"
    // recordar que es la misma instancia del ProductsService solo que necesitamos hacer este llamado
    final productsServices = Provider.of<ProductsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      // la ventaja de utilizar el Widget ListView.builder() es que cuando la lista es muy numerosa connstruye sus Widgets hijos a medida de que
      // el usuario vaya haciedno scroll, a diferncia de el Widget LisView() que crea de manera automatica todos los elementos ya que normalmente
      // usamos el Widget ListView() para listas pequeñs
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            // en caso un Widget no tenga una propiedad con la cual pueda lanzar alguna funcion
            // como el "onTap" o "onPressed" podemos usar el Widget GestureDectector()
            // dicho Widget debe de encerrar al Widget al que queremos darle la accion en este caso
            // a el Widget ProductCard()
            return GestureDetector(
              child: ProductCard(),
              // la accion que se lanzara al momento de usar la propiedad "onTap" sera movernos a otro Screen en este caso a ProductScreen()
              // pero de manera de que podamos volver a este Screen es decir a HomeScreen() para eso debemos de usar el "Navigator.pushNamed()
              onTap: () => Navigator.pushNamed(context, 'product'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
