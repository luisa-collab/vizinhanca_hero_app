import 'package:flutter/material.dart';

void main() {
  runApp(const VizinhançaHeroApp());
}

class VizinhançaHeroApp extends StatelessWidget {
  const VizinhançaHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vizinhança Hero App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cor principal do app
      ),
      home: const HomeScreen(), // Sua primeira tela
    );
  }
}

// --- Sua Primeira Tela (HomeScreen) ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vizinhança Hero'),
        centerTitle: true, // Centraliza o título
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Bem-vindo ao Vizinhança Hero!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Espaço entre os textos
            Text(
              'Sua conexão com freelancers da vizinhança.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            // Aqui você pode adicionar botões para "Sou Contratante" ou "Sou Freelancer"
            ElevatedButton(
              onPressed: null, // Desabilita o botão por enquanto
              child: Text('Login/Cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}