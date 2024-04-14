import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_textfield.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap
    });

  //Login method
  void login(BuildContext context) async{
    //auth service
    final authService = AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text, );
      _emailController.text;
      _pwController.text;
    }

    //cath any errors
    catch(e){
      showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),
      );
    }
  }

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
              color: Theme.of(context).colorScheme.primary  ,
            ),

            const SizedBox(height: 50), //Espacio entre componentes

            //Welcome back message
            Text(
              "Welcome back, you've beewn missed!",
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

            const SizedBox(height: 25), //Espacio entre componentes

            //login button

            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",
                style:
                  TextStyle(color: Theme.of(context).colorScheme.primary)
                ),

                GestureDetector(
                  onTap: onTap,
                  child: Text("Register now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
