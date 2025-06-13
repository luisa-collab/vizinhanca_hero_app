import 'package:flutter/material.dart';

// Tela de Login do aplicativo 
class LoginScreen extends StatefulWidget { // Define a classe que representa a tela de login
    const LoginScreen({super.key}); // Construtor da classe, recebe uma chave de acesso opcional

    @override 
    State<LoginScreen> createState() => _LoginScreenState(); // Cria o estado da tela de login
}

class _LoginScreenState extends State<LoginScreen> { // Define o estado da tela de login
// GlobalKey para o formulário usada para validação 
final _formKey = GlobalKey<FormState>();
// Controladores para pegar o texto dos campos de entrada
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
// Função chamada ao tentar fazer login 
void _login() {
    // Valida o formulário 
    if (_formKey.currentState!.validate()) { // Se a validação for bem sucedida 
    
    // Futuramente aqui terá a chamada para o backend , para autenticar o usuário 
    final String email = _emailController.text; // Pega o email do controlador 
    final String password = _passwordController.text; // Pega a senha do controlador
    
    // Exibe uma mensagem de sucesso no momento.
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login realizado com sucesso para $email')),
    );

    // Navega de volta para a tela incial após o login 
    // Usa pushReplacementNamed para que o usuário não volte para a tela de login ao pressionar o botão de voltar
    Navigator.pushReplacementNamed(context, '/');
  }
}

@override 
void dispose () { 
    // Descarta os controladores quando a tela não for mais usada para liberar memória. 
    _emailController.dispose(); // Descarta o controlador de email
    _passwordController.dispose(); // Descarta o controlador de senha
    super.dispose(); // Chama o Método dispose da superClasse 
}

@override
Widget build(BuildContext context) {
    return Scaffold( // Cria a estrutura básica da tela de login
    appBar: AppBar( // Barra de navegação superior
        title: const Text('Login'), // Título da barra de navegação
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.blue.shade700, // cor de fundo da barra de navegação
    ),
    body: Center( // centraliza o conteúdo da tela
    child: SingleChildScrollView( // Permite rolagem se o teclado aparecer 
    padding: const EdgeInsets.all(24.0), // Espaçamento interno da tela
    child: Form( // Cria um formulario para validação
        key: _formKey, // Chave do formulário para validação
        child: Column( // Coluna para organizar os campos de entrada
           mainAxisAligment: MainAxisAlignment.center , // Alinha os itens no centro da coluna
           crossAxisAlignment: CrossAxisAlignment.stretch, // Estica os itens para preencher a largura
           children: <Widget>[ // Lista de widgets filhos
           
           // Imagem logo do aplicativo
           image.asset( // 'assets/logo.png', // Caminho da imagem
           'assets/logo.png', // Caminho da imagem
           heigth: 130, // altura da imagem
           errorBuilder: (context,error, stackTrace) => Icon(
            Icons.people_alt, // Ícone de erro se a imagem não carregar
            size: 130, // Tamanho do ícone
            color: Colors.blue.shade500, // Cor do ícone
              ), // Fallback de icone
           ),
              const SizedBox(height: 50), // Espaçamento entre a imagem e o campo de email

              // Campo de entrada para o email
              TextFormField( // Campo de entrada de texto
                controller: _emailController, // Controlador do campo de email
                keyboardType: TextInputType.emailAddress, // teclado otimizado para email
                decoration: InputDecoration( // Decoração do campo de entrada
                labelText: 'Email', // Texto do rótulo
                hintText: 'Digite seu email', // Texto de dica
                prefixIcon: const Icon(Icons.email), // Ícone do email 
                border: OutlineInputBorder( // Borda do campo de entrada 
                borderRadius: borderRadius.circular(10), // Bordas arredondadas ))
                ),
                filled: true, // Preenche o campo de entrada
                filledColor: Colors.grey.shade100, // Cor de preenchimento do campo
                ),
                validator: (value){ // validação do campo de email
                if (value == null || value.isEmpty) { // se o valor for nulo ou vazio
                return 'Por favor, digite seu email'; // Retorna mensagem de erro
                }
                if (!value.contains('@') || !value.contains('.')) { // se o valor não contiver '@' ou '.'
                return 'Email inválido'; // Retorna mensagem de erro
                }
                return null; // Retorna nulo se a validação for bem sucedida
                }
              ),
                const SizedBox(height: 20), // Espaçamento entre o campo de email e o campo de senha

                // Campo de entrada para a senha.
                TextFormField( // Campo de entrada de texto para a senha
                  controller: _passwordController, // Controlador do campo de senha
                  obscureText: true, // Oculta o texto para senhas.
                  decoration: InputDecoration( // Decoração do campo de entrada
                    labelText: 'Senha', 
                    prefixIcon: const Icon(Icons.lock), // Ícone de senha
                    border: OutlineInputBorder( // Borda do campo de entrada
                      borderRadius: BorderRadius.circular(10), // Bordas arredondadas
                    ),
                    filled: true, // Preenche o campo de entrada
                    // Cor de preenchimento do campo de senha
                    fillColor: Colors.grey.shade100,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) { // Verifica se o campo de senha está vazio
                      return 'Por favor, insira sua senha';
                    }
                    if (value.length < 6) { // Verifica se a senha tem pelo menos 6 caracteres
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    return null; // Retorna nulo se a validação for bem sucedida
                  },
                ),
                const SizedBox(height: 30), // Espaçamento entre o campo de senha e o botão de login

                // Botão de login
                ElevatedButton(
                  onPressed: _login, // Chama a função _login ao ser pressionado.
                  style: ElevatedButton.styleFrom( // Estilo do botão de login
                    padding: const EdgeInsets.symmetric(vertical: 18), // Preenchimento vertical do botão
                    backgroundColor: Colors.blue.shade600, // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                    shape: RoundedRectangleBorder( // Forma do botão
                      // Bordas arredondadas do botão
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5, // Sombra do botão
                  ),
                  child: const Text( // Texto do botão de login
                    'Entrar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Estilo do texto do botão
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento entre o botão de login e o texto de cadastro

                 // Botão para ir para a tela de Cadastro.
                TextButton(
                  onPressed: () {
                    // Navega para a rota '/register'.
                    Navigator.pushNamed(context, '/register');
                  },
                  style: TextButton.styleFrom( // Estilo do botão de cadastro
                    foregroundColor: Colors.blue.shade500,
                  ),
                  child: const Text( // Texto do botão de cadastro
                    'Não tem uma conta? Cadastre-se aqui!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
        ),
      ),
    ),
    ),
  );
}
}
// Fim da classe LoginScreen
// Fim do arquivo lib/screens/login_screen.dart