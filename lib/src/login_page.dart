import 'package:flutter/material.dart';
import 'package:victordetailsflutter/src/components/imagebutton.dart';
import 'package:victordetailsflutter/src/components/loginbutton.dart';
import 'package:victordetailsflutter/src/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void SignUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                'seja bem vindo!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 50),
              MyTextField(
                controller: usernameController,
                obscureText: false,
                hintText: 'username',
              ),
              MyTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'senha',
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Esqueceu sua Senha?',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(onTap: SignUserIn),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ou continue com',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(imagePath: 'lib/src/images/apple.png'),
                  SizedBox(width: 20),
                  ImageButton(imagePath: 'lib/src/images/google.png')
                ],
              ),
              const SizedBox(height: 14),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Não é registrado?'),
                  Text(
                    '  registre-se agora!',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
