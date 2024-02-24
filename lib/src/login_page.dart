import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:victordetailsflutter/src/components/imagebutton.dart';
import 'package:victordetailsflutter/src/components/loginbutton.dart';
import 'package:victordetailsflutter/src/components/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  double get height => MediaQuery.of(context).size.height;

  Future<void> signUserIn() async {
    showDialog<void>(
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

      if (mounted) {
        Navigator.pop(context);
      }
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          toolbarHeight: height * 0.3,
          backgroundColor: Colors.grey.shade300,
          title: Image.asset('assets/images/logovitor.png', width: 300),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(180, 90))),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Efetue o login:',
                  style: TextStyle(
                      color: Color.fromRGBO(148, 0, 0, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: 'E-mail',
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  obscureText: !isVisible,
                  hintText: 'Senha',
                  suffixIcon: IconButton(
                      onPressed: () => setState(() => isVisible = !isVisible),
                      color: const Color.fromRGBO(173, 143, 54, 1),
                      icon: isVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Esqueceu sua senha?',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(onTap: () async => await signUserIn()),
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
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade500,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageButton(imagePath: 'assets/images/apple.png'),
                    SizedBox(width: 20),
                    ImageButton(imagePath: 'assets/images/google.png')
                  ],
                ),
                const SizedBox(height: 14),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Não é registrado?'),
                    Text(
                      ' registre-se agora!',
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
      ),
    );
  }
}
