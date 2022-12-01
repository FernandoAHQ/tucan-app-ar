import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../config/palette.dart';
import '../screens/home_screen.dart';

import '../providers/userData.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
         decoration: const BoxDecoration(color: Palette.scaffold),
          child: const _LoginForm(),
          
          
         
        ),
      )
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({ Key? key }) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
    late String _user;
  late String _password;
   bool _passwordVisible = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
            final providerUser = Provider.of<ProviderUserData>(context);
    Size size = MediaQuery.of(context).size;
    bool _isLoading = providerUser.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
        //    color: Colors.green,
            height: size.height * 0.55,
            padding: EdgeInsets.fromLTRB(0, 70, 0, 25),
            child: Column(
              children:  [
              Center(child: Image(image:  const AssetImage('assets/images/logo.png'), height: size.height * 0.3, )),

           const Text(
            "¡Bienvenido!",
            style: TextStyle(
                fontSize: 38, color: Colors.black, fontWeight: FontWeight.w600),
          ),
           const Text(
            "Inicia sesión para continuar",
            style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 87, 87, 87),
                fontWeight: FontWeight.w400),
          ),
              ],
            ),
          ),
         
          Container(
            padding: const EdgeInsets.all(10),
         //   color: Colors.red,
            height: size.height * 0.40,
            child: Column(
              children: [
                 Container(
            child: TextFormField(
              style: const TextStyle(fontSize: 24.0, color: Palette.darkGrey),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                  hintText: "Numero de Control",
                  icon: Icon(
                    Icons.person,
                    color: Palette.tecBlue,
                  ),
                  border: InputBorder.none),
              onSaved: (value) {
                _user = value.toString();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Usuario Invalido MT";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
            ),
            width: MediaQuery.of(context).size.width * .85,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Palette.tecGreyLight,
              borderRadius: BorderRadius.circular(29),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Container(
            child: TextFormField(
              style: const TextStyle(fontSize: 24, color: Palette.darkGrey),
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                  hintText: "Contraseña",
                  icon: const Icon(
                    Icons.lock,
                    color: Palette.tecBlue,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                        print(_passwordVisible);
                      });
                    },
                  ),
                  border: InputBorder.none),
              onSaved: (value) {
                _password = value.toString();
              },
              validator: (value) {
                if (value.toString().isEmpty) {
                  return "Contraseña Invalida";
                } else {
                  return null;
                }
              },
            ),
            width: MediaQuery.of(context).size.width * .85,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Palette.tecGreyLight,
              borderRadius: BorderRadius.circular(29),
            ),
          ),
          SizedBox(
            height: size.height * .05,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: SizedBox(
              child: MaterialButton(
                onPressed: () async => {
                  
                  if (_formKey.currentState!.validate())
                    {
                      _formKey.currentState!.save(),
                      print(_user + ", " + _password + "\n"),
                      if (!providerUser.isLoading)
                        {
                          if (await providerUser.authUser(_user, _password))
                            {
                              print("PASSED"),
                                     ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("¡Bienvenido!"),
                              )),
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()))
                            }
                          else
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Datos Incorrectos"),
                              ))
                            }
                        }
                    }
                },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0),
                      ),
                color: Palette.tecBlue,
              ),
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height * .07,
            ),
          ),
              ],
            ),
          )
        ],
      ),
    );
  }
}




