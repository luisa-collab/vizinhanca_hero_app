import 'package:flutter/material.dart';
import 'package:vizinhanca_hero_app/screens/home_screen.dart';
import 'package:vizinhanca_hero_app/screens/login_screen.dart';
import 'package:vizinhanca_hero_app/screens/register_screen.dart';

// Função que inicializa o aplicativo
void main() {
  runApp(const VizinhancaHeroApp());
}

// Classe principal do aplicativo 
// que estende StatelessWidget - Que siginifica que os dados desta tela não mudam com o tempo.
class VizinhancaHeroApp extends StatelessWidget {
  const VizinhancaHeroApp({super.key});

  @override // Método que constrói a interface do aplicativo
  Widget build(BuildContext context) {
    // MaterialApp é o widget raiz para aplicativos que usam o Material Design
    return MaterialApp(
      title: 'Vizinhança Hero App', // Título do aplicativo.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor principal para os elementos do Material Design.
        visualDensity: VisualDensity.adaptiveIPlatformDensity, // Ajusta o layout para diferentes plataformas. 
        fontFamily: 'Poppins', // Define a fonte padrão do aplicativo.
      ),
      initialRoute: '/', // Define a rota inicial 
      routes: {
        '/': (context) => const HomeScreen(), // Rota para a tela inicial 
        '/login': (context) => const LoginScreen(), // Rota para a tela de login
        '/register': (context) => const RegisterScreen(), // Rota para a tela de cadastro.
      },
    );
  }
}
