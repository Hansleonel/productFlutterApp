import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget childCardContainer;

  // establecemos una propiedad obligatoria para nuestro Widget CardContainer(), en este caso
  // dicha propiedad sera del tipo Widget y tendra el nombre de childCardContainer()
  const CardContainer({Key? key, required this.childCardContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        // color: Colors.red,
        // ya que la propiedad "decoration" recibe un parametro del tipo Decoration
        // podemos establecer a BoxDecoration como parametro recibido
        // pero como vemos dicho BoxDecoration tendra su propia complejidad es por eso que para mantener el codigo limpio
        // es por eso que extraemos a dicho BoxDecoration como un metodo con el nombre de _createCardShape()
        decoration: _createCardShape(),
        child: this.childCardContainer,
      ),
    );
  }

  // Metodo _CreateCardShape() que devuelv un BoxDecoration()
  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          // propiedad del Decoration BoxDecoration de nombre "boxShadow" que nos permite personalizr
          // la sombr de BoxDecoration
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 12, offset: Offset(0, 5))
          ]);
}
