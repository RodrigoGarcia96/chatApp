import 'package:chat/pages/PantallaDeButtonRojo.dart';
import 'package:chat/pages/settings_page.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //Logo con imagen
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'assets/logo.png', // Ruta de la imagen en tu proyecto
                  width: 59, // Ancho deseado de la imagen
                  height: 59, // Alto deseado de la imagen
                  color: Theme.of(context)
                      .colorScheme
                      .primary, // Color de la imagen
                ),
              ),
            ),
              
              /*  Icono del drawer
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),  */

              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title:const Text("C H A T S"),
                  leading:const Icon(Icons.message),
                  onTap: () {
                    //pop drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("A J U S T E S"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ),

              // Botón de pánico
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("¿Estas en una Emergencia?"),
                  leading: const Icon(Icons.minor_crash),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    // navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaDeButtonRoj(),
                      ),
                    );
                  },
                ),
              ),


            ],
          ), //Fin del contenerdor principal del drawer

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text("S A L I R"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
