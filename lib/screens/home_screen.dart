import 'package:flutter/material.dart';

// A tela inicial do aplicativo, que é a tela de boas-vindas.
class HomeScreen extends StatelessWidget { 
    const HomeScreen({super.key});

    @ovirride // Método que constrói a interface do usuário para a tela inicial.
    Widget build(BuidContext context) {
        return Scaffold( // Scaffold é um widget que fornece uma estrutura básica para a tela.
        appBar: AppBar ( // AppBar é a barra de título na parte superior da tela.
        title: const Text('Vizinhança Hero App'), // Título da AppBar.
        centerTitle: true, // Centraliza o Título do AppBar.
        backgroundColor: Colors.blue.shade700, // Define a cor de fundo do AppBar. // tom de azul escuro.
        ),
        body: Center ( // Center é um widget que centraliza seu filho na tela.
            child: Padding( // Padding adiciona espaçamento ao redor do widget filho.
            padding: const EdgeInsets.all(16.0), // Define o espaçamento de 16 pixels em todos os lados 
            child: Column( // Column organiza seus filhos em uma coluna vertical. 
            mainAxisAlignment: MainAxisAlignment.center, // Alinha os filhos no centro da coluna
            children: <Widget>[
                // Titulo de Boas Vindas com estilo aprimorado
                Text(
                    'Bem-vindo ao Vizinhança Hero App!', // Texto de boas-vindas
                    style: TextStyle(
                        fontSize: 32, // Tamanho da fonte do texto 
                        fontWeight: FontWeight.bold, // Define o peso da fonte como negrito
                        color: Colors.blue.shade800, // Define a cor do texto com um tom de azul escuro 
                    ),
                    textAlign: TextAlign.center, // centraliza o texto
                ),
                const SizedBox(height: 20), // Espaçamento vertical entre os widgets 
                // Subtítulo Descritivo
                Text(
                    'Conectando vizinhos e fortalecendo comunidades',
                    style: TextStyle(
                        fontSize: 18, // Tamanho da fonte do subtítulo
                        color: Colors.grey.shade700, // Define a cor do subtítulo com um tom de cinza escuro
                    ),
                    textAlign: TextAlign.center, // centraliza o texto
                    ),
                    const SizedBox(height: 60), // espaçamento maior antes dos botões
                    // Botão para navegar para a tela de login
                    SizedBox(
                        width: double.infinity, // Define a largura do botão para ocupar todo o espaço disponível
                        child: ElevatedButton(
                            onPressed: () { 
                                // Navega para a tela de login quando o botão é pressionado, definida no main.dart
                                Navigator.pushNamed(context, '/login');
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16), // padding interno do botão 
                                backgroundColor: Colors.blue.shede600, // Define a cor do fundo do botão 
                                foregroundColor: Colors.white, // Cor do texto do botão 
                                shape: RoundedRectangleBorder( // Define a forma do botão como um retângulo arredondado
                                bourderRadius: BorderRadius.circular(10), // Define o raio de arredondamento , bordas arredondadas
                                ),
                                elevation: 5, // Define a elevação do botão para criar uma sombra.
                            ),
                            child: const Text( 
                                'Entrar / Cadastrar', // texto do botão 
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Define o estilo do texto do botão 
                            ),
                        ),
                    ),
                    const SizedBox(height: 20), // Espaço entre os botões

                    // Botão para uma ação futura (exemplo:, "Ver Tarefas".
                    // Pode ser removido ou alterado conforme o desenvolvimento .
                    TextButton(
                        onPressed: () { 
                            // Futuramente: navegação para uma tela de visualização pública ou informações
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Funcionalidade em desenvolvimento')),
                            )
                        },
                        style: TextButton.styleFrom( 
                            foregroundColor: Colors.blue.shade500, // Define a cor do texto do botão 
                        ),
                        child: const Text(
                            'Saiba Mais', // Texto do botão 
                            style: TextStyle(fontSize: 16), // Tamanho da fonte do texto do botão 
                        ),
                    ),
                ],
            ),
        ),
        ),                      
        );
    }
}