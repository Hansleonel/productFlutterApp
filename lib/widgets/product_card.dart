import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {
  // creando una propiedad del tipo Product
  final Product product;

  // creando el constructor para la propiedad product que en este caso sera
  // required, ademas vemos que dicha propiedad es nominal
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: EdgeInsets.only(top: 32, bottom: 48),
        width: double.infinity,
        height: 400,
        // para poder personalizar el Widget ProductCard()
        // debemos de utilizar la propiedad "decoration"
        // recoerdemos que si usamos la propiedad  decoration()
        // no podemos usar la propiedad "color"
        // ademas para facilitar la lectura del code debemos de extraer el method
        // en nuevo method mas ordenado y limpio
        decoration: _cardDecoration(),
        // usaremos un Widget Stack como child e nuestro Widget Container()
        // para superponer Widgtes
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(
              urlImage: product.picture,
            ),
            // como sabemos la propiedad "id" de nuestro Producto no es obligatoria
            // pero tambien sabemos que llegado al punto de mostrar los productos
            // sabemos que ya obtuvimos una respuesta de nuestra peticion http es por eso
            // que debemos de asegurarle a Dart que la propiedad "id" si tiene un valor asignado
            // con el signo "!" que nos permite realizar dicha acción
            _ProductDetails(
              title: product.name,
              subTitle: product.id!,
            ),
            // en caso le queramos dar una posicion fija a un Widget y no queremos que se guie de la
            // propiedad del Widget padre Stack() con su propiedad "aligment()"
            // debemos de envolver el Widget hijo con el Widget Positioned()
            // como vemos funcina estableciendo valores a sus propeidades "top", "rigth", "left", "bottom"
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(
                  price: product.price,
                )),
            // en caso el valor de la propiedad "avialable" sea false
            // mostrar el Widget "_StatusAvialable()"
            if (!product.available)
              Positioned(top: 0, left: 0, child: _StatusAvailable())
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                // la propiedad "color" nos permite establecer el color del BoxShadow()
                color: Colors.black12,
                // la propiedad offset nos permite establecer la direccion del color del BoxShadow()
                offset: Offset(0, 7),
                // la propiedad blurRadius nos permite establecer el blur del color del BoxShadow()
                blurRadius: 10)
          ]);
}

class _StatusAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'no disponible',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), bottomRight: Radius.circular(24))),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // el Widget FittedBox() permite que el contenido del Widget hijo e este caso de el conteidno del Widget Padding()
      // se adapte al tamaño que tiene para mostrarse, en este caso el texto de precio
      // se adapta de acuerdo al tamaño de dicho texto
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '$price',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), bottomLeft: Radius.circular(24))),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String title;
  final String subTitle;

  const _ProductDetails({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // como vemos ahora neceisamos que el Widget Container() segun el design
      // tenga un tamaño especifico y tenga una separacion a lado derecho el Widget _BackgroundImage()
      // dicha separacion la podemos realizar con el Widget Padding() y su propiedad "padding"
      padding: EdgeInsets.only(right: 48),
      child: Container(
        // para añadir separacion del hijo del Widget Container() es decir el Widget Column()
        // debemos de utilizar la propiedad del Widget Container() "padding"
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        width: double.infinity,
        // color: Colors.indigo,
        // como vemos si quereremos darle una personalizacion especifica, como en este caso donde
        // queremos darle un borde cirular solo al buttomLeft y al top Rigth
        // debemos de usar la propiedad "decoration" que recibira un BoxDecoration()
        // que como vemos para facilitar la lectura del codigo, separamos dicho BoxDecoration()
        // en un nuevo metodo "_buildBoxDecoration()"
        decoration: _buildBoxDecoration(),
        height: 64,
        child: Column(
          // cuando queremos alinear de forma  horizontal debemos de usar la propiedad "crossAxisAligment"
          // si queremos alinearlo de manera orizontal debemos de usar la prpoeidad "mainAxisAligment"
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              // la propiedad "overflow" es usada para que el texto no se sobraslga del espacio que tiene dentro del Widget
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      // dandole color
      color: Colors.indigo,
      // dandole bordes solo al buttomLeft y al topRigth de nuestro Widget Container()
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24), topRight: Radius.circular(24)));
}

class _BackgroundImage extends StatelessWidget {
  final String? urlImage;

  const _BackgroundImage({Key? key, this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // como vemos cuando usamos solo el Widget Container() y este tiene una imagen mas grande que el mismo Widget Container()
    // es reocmendado usar el Widget ClipRRect()
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
          width: double.infinity,
          height: 400,
          // Widget FadeInImage() para poder usar su propiedad "placeHolder" que nos permite mostrar una imagen
          // hasta que la carga de la imagen esperada sea cargada toalmente
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            // con este signo "!" le aseguramos a Dart que esta variable siempre tendra valor
            // es por eso que debemos de asegurarnos que tenga dicho valor
            image: NetworkImage(urlImage!),
            fit: BoxFit.cover,
          )),
    );
  }
}
