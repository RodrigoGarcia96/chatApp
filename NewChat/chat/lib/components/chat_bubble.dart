import 'package:chat/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;


  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    });

  @override
  Widget build(BuildContext context) {
    // light vs dark mode for correct bubble colors
    bool isDarkMode =
      Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    


    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
        ? (isDarkMode ? Colors.blue.shade600 : Colors.blue.shade500)
        : (isDarkMode ? Colors.grey.shade800: Colors.grey.shade200), //colores de la burbuja del chat
        borderRadius: BorderRadius.circular(12), //Esto es de la redondez de la burbuja
      ),
      padding: const EdgeInsets.all(16), //Tamaño de la burbuja
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal:25), //Espacio de la burbuja con las tras burbujas

      child: Text(
        message,
        style: TextStyle(
          color:isCurrentUser
          ? Colors.white
          : (isDarkMode ? Colors.white : Colors.black)), //color del texto del mensaje
        ),
    );
  }
}