import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/ui/InputDecorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // como vemos queremos manejar los valores inseratados en este Screen, es decir LoginScreen()
        // pero necesimos ubicar el Widget que manejara dichos valores dentro de nuestro Widget AuthBackground()
        // es por eso que necesitamos enviarle un Widget como parametro a nuestro Widget AuthBackground
        body: AuthBackground(
            // TODO como sabemos la propiedad "child" de nuestro AuthBackground es obligatoria, ademas sabemos que recibe un Widget
            // asi que le enviamos un Widget SingleChildScrollView(), enviamos este Widget porque nos permite hacer Scroll en caso
            // el tamaño de los Widgets que recive su propiedad "children" sea mas grande que resolucion total de la pantalla
            // es por eso que podemos hacer Scroll cuando tengamos multiples Widgets recibidos por la propiedad "child" incluso con el teclado
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 250),
          CardContainer(
            // la propiedad "childCardContainer" recive un Widget y es una propiedad obligatoria
            // puesto que asi la establecimos
            childCardContainer: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 32,
                ),
                // creamos un nuevo Widget que nos permita manera de manera mas limpia la logica del formulario
                // ademas para hacer uso del manejador de estados Provider debemos de establecer una instancia de nuestro
                // Provider en este caso del LoginFromProvider() con el uso de "ChangeNotifierProvider"
                // o "Multiprovider", en caso sea el llamado a un unico Provider podemos usar el "ChangeNotifierProvider"
                // TODO como en este caso solo necesitamos hacer uso del provider LoginFormProvider() dentro de este Widget _LoginForm()
                // TODO podemos establecer el ChangeNotifierProvider o el Multiprovider desde aqui,
                // a diferencia de applications mas complejas como por ejemplo el de peliculas
                // donde estableciamos la instancia en la parte superior del arbol de Widgets
                ChangeNotifierProvider(
                  // creando una instancia de nuestro Provider
                  create: (BuildContext context) => LoginFormProvider(),
                  child: _LoginForm(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Text('Crear una nueva cuenta'),
          SizedBox(
            height: 36,
          )
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // generalmente accedemos a nuestro Provider dentro del Build de nuestro Widget asosciado a dicho Provider
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Container(
      // la propiedad child recibira a este nuevo Widget Form()
      child: Form(
          // TODO: mantener la referencia al KEY
          // asociando nuestro GlobalKey creado dentro de nuestro LoginFormProvider
          // con el key de este formulario
          key: loginFormProvider.formKeyUnique,
          // la propiedad "autovalidateMode" nos permite decirle al Widget Form()
          // cuando se deben de utilizar las validaciones de cada children, en este caso de cada TextFormField()
          // dichas validaciones se componen por reglas establecidas dentro la propiedad "validator" de cada children de nuestro Widget From()
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                // como vemos podemos usar un metodo particular en este caso un metodo de la carpt
                // ui que nos devulv un InputDecoration particular puesto que le enviaremos parametros
                // por cada tipo de personalizacn que queramos
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'jhon@gmail.com',
                    labelText: 'Ingrese correo electronico',
                    prefixIcon: Icons.alternate_email_rounded),
                // estableciendo valores a las propeiades de nuestro Provider en este caso a la propiedad "email"
                // con el valor que recibe el Widget TextFormField()
                onChanged: (valorTextFormField) {
                  loginFormProvider.email = valorTextFormField;
                },
                validator: (valorTexFormField) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  // como sabemos debemos de retrn un String o un null
                  // en caso cumpla con la validacion retrn un null
                  // en caso no cumpla con la validacionn, debemos retrn un mensaje, en este caso "el valor ingresado no parece ser un correo"
                  // ademas por usar el nullsafety dart nos advierne que no siempre vamos a recibir el valor de la variable "valorTextFormField"
                  // es por eso que debemos de usar la expresion "?? ''" que significa que en caso no recibamos el valor de la variable "valorTextFormField"
                  // debemos de tratarlo como un string ''
                  return regExp.hasMatch(valorTexFormField ?? '')
                      ? null
                      : 'el valor ingresado no parece ser un correo';
                },
              ),
              SizedBox(height: 32),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.text,
                // como vemos podemos usar un metodo particular en este caso un metodo de la carpt
                // ui que nos devulv un InputDecoration particular puesto que le enviaremos parametros
                // por cada tipo de personalizacn que queramos
                decoration: InputDecorations.authInputDecoration(
                    hintText: '*****',
                    labelText: 'Ingrese password',
                    prefixIcon: Icons.security),
                // estableciendo valores a las propiedades de nuestro Provider en este caso a la propiedad "password"
                // con el valor que recibe el Widget TextFormField()
                onChanged: (valorTextFormField) {
                  loginFormProvider.password = valorTextFormField;
                },
                validator: (valorTextFormField) {
                  if (valorTextFormField != null &&
                      valorTextFormField.length >= 6) {
                    return null;
                  }
                  return 'el valor ingresado debe de tener por lo menos 6 caracteres';
                },
              ),
              SizedBox(height: 32),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                      child: Text(
                          // usando el getter de nuestro Provider para obetener el valor de la variable privada _isLoading
                          // en caso la variable sea verdadera, el texto de nuestro Widget Text() sera 'Espere'
                          // y en caso la variable _isLoading sea falsa, el texto de nuestro Widget Text() sera 'Ingresar'
                          loginFormProvider.getIsLoading
                              ? 'Espere'
                              : 'Ingresar',
                          style: TextStyle(color: Colors.white))),
                  // al momento de realizar el onPressed a nuestro Widget MaterialButto()
                  // hacemos una validacion previa con la ayuda de nuestro getter "getIsLoading"
                  // que nos devuelve el valor de nuestra variable "_isLoading"
                  // en caso sea true significa que esta cargando y no realizamos ninguna accion y deolvemos null lo cual desactiva el
                  // Widget MaterialButton()
                  // en caso sea false significa que si podemos realizar una peticion puesto que no esta cargando alguna otra peticion
                  // y devolvms toda la funcion
                  onPressed: loginFormProvider.getIsLoading
                      ? null
                      : () async {
                          // con la siguiente linea podemos establecer que el teclad se ocult
                          FocusScope.of(context).unfocus();
                          // Utilizando el metodo ".isValidForm()" de nuestro Provider que con la ayuda de nuestro GlobalKey
                          // que es del tipo FormState, nos permite lanzar todos las funciones de validacio que se encuentren dentro
                          // de dicho Widget Form() asociado
                          // ademas le agregamos la condicion de que en caso no cumpla con la condicionn de la validacion
                          // es decir ".isValidForm" sea false no realizar alguna accion y usar el retrn para no continr con las demas lineas
                          // if (!loginFormProvider.isValidForm()) return;
                          // en caso si cumpla no entra en el if de la parte superior
                          // y perminitirnos navegar al Screen HomeScreen()
                          // recordar que cuando usamos ".pushReplacementNamed()" reemplazamos todos los Screens Anteriores
                          // por lo cual no existe un Screen a donde volvr
                          // Navigator.pushReplacementNamed(context, 'home');
                          if (!loginFormProvider.isValidForm()) {
                            print("debe de cumplir con las condiciones");
                          } else {
                            // en caso se cumpla con las validaciones del Widget Form() con la ayuda de nuestro Provider "loginFromProvider"
                            // podemos usar el setter para modificar el valor de la variable privada _isLoading
                            // ademas no solo se modifica el valor de la variable sino tambien la interfaz puesto que dicho setter "setIsLoading"
                            // contiene la instruccion notifyListeners() que actaliza la interfaz del los Widgets que usar dicho Provider
                            // en este caso solo del Widget _LoginForm() por completo
                            loginFormProvider.setIsLoading = true;

                            // simuland una peticion http que espera un respuesta para que despues pueda navegar al Screen HomeScreen
                            await Future.delayed(Duration(seconds: 2));

                            // TODO punto de validacion
                            loginFormProvider.setIsLoading = false;

                            Navigator.pushReplacementNamed(context, 'home');
                          }
                        })
            ],
          )),
    );
  }
}
