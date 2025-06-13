import 'package:flutter/material.dart';

// Tela de Cadastro do aplicativo.
class RegisterScreen extends StatefulWidget { // Define a classe que representa a tela de cadastro
  const RegisterScreen({super.key}); // Construtor da classe, recebe uma chave de acesso opcional

    @override
     State<RegisterScreen> createState() => _RegisterScreenState(); // Cria o estado da tela de cadastro
}

class _RegisterScreenState extends State<RegisterScreen> { // Define o estado da tela de cadastro
  // GlobalKey para o formulário usada para validação
  final _formKey = GlobalKey<FormState>(); // Chave do formulário para validação
  // Controladores para pegar o texto dos campos de entrada
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Função chamada ao tentar cadastrar.
  void _register() { // Valida o formulário
    // Se a validação passar, simula o cadastro.
    if (_formKey.currentState!.validate()) { // Se a validação for bem sucedida
      // Exibe uma mensagem de sucesso no momento.
      // Se a validação passar, simula o cadastro.
      // Futuramente, aqui você faria a chamada para o seu backend de registro.
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String password = _passwordController.text;

         // Exibe uma mensagem de sucesso no momento.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro simulado para $name ($email)')),
      );

      // Navega de volta para a tela de login após o cadastro simulado.
      // Permite que o usuário faça login com a nova conta.
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    // Descarta os controladores para liberar memória.
    _nameController.dispose(); // Libera o controlador do nome
    _emailController.dispose(); // Libera o controlador do email
    _passwordController.dispose(); // Libera o controlador da senha
    _confirmPasswordController.dispose(); // Libera o controlador da confirmação da senha
    super.dispose();
  }
  @override
  Widget build(BuildContext context) { // Cria a estrutura básica da tela de cadastro
    return Scaffold( // Scaffold é a estrutura básica da tela
      appBar: AppBar( // Barra de navegação superior
        title: const Text('Cadastro'), // Título da barra de navegação
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.blue.shade700, // Cor de fundo da barra de navegação
      ),
      body: Center( // Centraliza o conteúdo da tela
        child: SingleChildScrollView( // Permite rolar se o teclado aparecer.
          padding: const EdgeInsets.all(24.0), // Espaçamento interno da tela
          child: Form( // Cria um formulário para validação
            key: _formKey, // Chave do formulário para validação
            child: Column( // Coluna para organizar os campos de entrada
              mainAxisAlignment: MainAxisAlignment.center, // Alinha os itens no centro da coluna
              crossAxisAlignment: CrossAxisAlignment.stretch, // Estica os itens para preencher a largura
              children: <Widget>[ // Lista de widgets filhos
                // Imagem ou Ícone do aplicativo.
                Image.asset(
                  'assets/logo.png', // Substitua por seu logo real ou use um ícone temporário.
                  height: 100, // Altura da imagem
                  errorBuilder: (context, error, stackTrace) => Icon( // Fallback de ícone se a imagem não carregar
                    Icons.person_add, // Ícone de erro se a imagem não carregar
                    size: 100, // Tamanho do ícone
                    color: Colors.blue.shade400, // Cor do ícone
                  ), // Fallback de ícone
                ),
                const SizedBox(height: 30), // Espaçamento entre a imagem e o campo de nome
                
                // Campo de entrada para o nome
                 // Campo de Nome.
                TextFormField(
                  controller: _nameController, // Controlador para o campo de nome
                  keyboardType: TextInputType.text, // Tipo de teclado para texto
                  decoration: InputDecoration( // Decoração do campo de entrada
                    labelText: 'Nome Completo', // Rótulo do campo de entrada
                    hintText: 'Seu nome', // Texto de dica para o campo de entrada
                    prefixIcon: const Icon(Icons.person), // Ícone de prefixo no campo de entrada
                    border: OutlineInputBorder( // Borda do campo de entrada
                      borderRadius: BorderRadius.circular(10), // Raio da borda para arredondamento
                    ),
                    filled: true, // Preenchimento do campo de entrada
                    // Cor de preenchimento do campo de entrada
                    fillColor: Colors.grey.shade100,
                  ),
                  validator: (value) { // Validação do campo de nome
                    if (value == null || value.isEmpty) {   // Verifica se o campo está vazio
                      return 'Por favor, insira seu nome'; // Retorna mensagem de erro se o campo estiver vazio
                    }
                    return null; // Retorna null se a validação passar
                  },
                ),
                const SizedBox(height: 20), // Espaçamento entre o campo de nome e o campo de e-mail

                // Campo de E-mail.
                TextFormField(
                  controller: _emailController, // Controlador para o campo de e-mail
                  keyboardType: TextInputType.emailAddress, // Tipo de teclado para e-mail
                  decoration: InputDecoration( // Decoração do campo de entrada
                    labelText: 'E-mail', // Rótulo do campo de entrada
                    hintText: 'seu.email@example.com', // Texto de dica para o campo de entrada
                    prefixIcon: const Icon(Icons.email), // Ícone de prefixo no campo de entrada
                    border: OutlineInputBorder( // Borda do campo de entrada
                      borderRadius: BorderRadius.circular(10), // Raio da borda para arredondamento
                    ),
                    filled: true, // Preenchimento do campo de entrada
                    fillColor: Colors.grey.shade100, // Cor de preenchimento do campo de entrada
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) { // Verifica se o campo está vazio
                      return 'Por favor, insira seu e-mail'; // Retorna mensagem de erro se o campo estiver vazio
                    }
                    if (!value.contains('@') || !value.contains('.')) { // Verifica se o e-mail contém '@' e '.'
                      // Verifica se o e-mail é válido
                      return 'E-mail inválido';
                    }
                    return null; // Retorna null se a validação passar
                  },
                ),
                const SizedBox(height: 20), // Espaçamento entre o campo de e-mail e o campo de senha

                // Campo de Senha.
                TextFormField(
                  controller: _passwordController, // Controlador para o campo de senha
                  obscureText: true, // Oculta o texto da senha
                  decoration: InputDecoration( // Decoração do campo de entrada
                    labelText: 'Senha', // Rótulo do campo de entrada
                    prefixIcon: const Icon(Icons.lock), // Ícone de prefixo no campo de entrada
                    border: OutlineInputBorder( // Borda do campo de entrada
                      borderRadius: BorderRadius.circular(10), // Raio da borda para arredondamento
                    ),
                    filled: true, // Preenchimento do campo de entrada
                    fillColor: Colors.grey.shade100, // Cor de preenchimento do campo de entrada
                  ),
                  validator: (value) { // Validação do campo de senha
                    if (value == null || value.isEmpty) { // Verifica se o campo está vazio
                      return 'Por favor, insira sua senha'; // Retorna mensagem de erro se o campo estiver vazio
                    }
                    if (value.length < 6) { // Verifica se a senha tem pelo menos 6 caracteres
                      return 'A senha deve ter pelo menos 6 caracteres'; // Retorna mensagem de erro se a senha for muito curta
                    }
                    return null; // Retorna null se a validação passar
                  },
                ),
                const SizedBox(height: 20),

                // Campo de Confirmação de Senha.
                TextFormField(
                  controller: _confirmPasswordController, // Controlador para o campo de confirmação de senha
                  obscureText: true, // Oculta o texto da confirmação de senha
                  decoration: InputDecoration( // Decoração do campo de entrada 
                    labelText: 'Confirmar Senha',   // Rótulo do campo de entrada
                    prefixIcon: const Icon(Icons.lock_reset), // Ícone de prefixo no campo de entrada
                    border: OutlineInputBorder( // Borda do campo de entrada 
                      borderRadius: BorderRadius.circular(10),  // Raio da borda para arredondamento
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100, // Cor de preenchimento do campo de entrada
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) { // Verifica se o campo está vazio
                      return 'Por favor, confirme sua senha'; // Retorna mensagem de erro se o campo estiver vazio
                    }
                    if (value != _passwordController.text) { // Verifica se a confirmação de senha corresponde à senha original
                      return 'As senhas não coincidem'; // Verifica se a confirmação de senha corresponde à senha original
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30), // Espaçamento entre o campo de confirmação de senha e o botão de cadastro
                // Espaçamento entre o campo de confirmação de senha e o botão de cadastro

                // Botão de Cadastro.
                ElevatedButton(
                  onPressed: _register, // Chama a função de registro ao pressionar o botão 
                  style: ElevatedButton.styleFrom( // Estilo do botão de cadastro
                    padding: const EdgeInsets.symmetric(vertical: 18), // Preenchimento vertical do botão
                    backgroundColor: Colors.blue.shade600, // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                    shape: RoundedRectangleBorder( // Forma do botão
                      borderRadius: BorderRadius.circular(12), // Raio da borda para arredondamento
                    ),
                    elevation: 5, // Elevação do botão para sombra
                  ),
                  child: const Text(  // Texto do botão de cadastro
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Estilo do texto do botão
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento entre o botão de cadastro e o botão de login
                // Botão para ir para a tela de Login.
                TextButton( // Botão de texto para ir para a tela de login
                  onPressed: () { // Ao pressionar o botão, navega para a tela de login
                    // Navega de volta para a tela de login.
                    Navigator.pop(context); // Pop tira a tela atual da pilha de navegação.
                  },
                  style: TextButton.styleFrom( // Estilo do botão de texto
                    foregroundColor: Colors.blue.shade500, // Cor do texto do botão
                  ),
                  child: const Text( // Texto do botão de texto
                    'Já tem uma conta? Faça Login!', // Texto do botão de texto
                    style: TextStyle(fontSize: 16), // Estilo do texto do botão
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


