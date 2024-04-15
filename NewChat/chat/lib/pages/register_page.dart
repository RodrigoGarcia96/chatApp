import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_textfield.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  //email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  //register method
  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();

    //password match -> create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // password dont match -> show error to user

    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("¡LA CONTRASEÑA NO COINCIDE!"),
        ),
      );
    }
  }

  //Aqui empieza la parte visual

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50), //Espacio entre componentes

            //Welcome back message
            Text(
              "Let´s create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25), //Espacio entre componentes

            //email textfield
            MyTextField(
              hintText: "E-mail",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10), //Espacio entre componentes

            //pw textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 10), //Espacio entre componentes

            //Confirmpw textfield
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
            ),

            const SizedBox(height: 25), //Espacio entre componentes

            //login button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
