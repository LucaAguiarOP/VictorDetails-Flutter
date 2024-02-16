import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:victordetailsflutter/src/components/imagebutton.dart';
import 'package:victordetailsflutter/src/components/loginbutton.dart';
import 'package:victordetailsflutter/src/components/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (emailController.text == '') {
        emptyEmailMessage();
      } else if (emailController.text == '' && passwordController.text == '') {
        wrongEmailandPassMessage();
      } else if (emailController.text == '') {
        emptyEmailMessage();
      }

      //   } else if (e.code == 'wrong-password') {
      //     wrongPassMessage();
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email incorreto'),
        );
      },
    );
  }

  void wrongEmailandPassMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email e senhas'),
        );
      },
    );
  }

  void emptyEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email vazio'),
        );
      },
    );
  }

  void emptyPassMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email errado'),
        );
      },
    );
  }

  void wrongPassMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Senha errada'),
        );
      },
    );
  }

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
              Image.asset(
                'lib/src/images/logovitor.png',
                height: 200,
              ),
              const SizedBox(height: 30),
              MyTextField(
                controller: emailController,
                obscureText: false,
                hintText: 'E-mail',
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
              const SizedBox(height: 40),
              MyButton(onTap: signUserIn),
              const SizedBox(height: 20),
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
