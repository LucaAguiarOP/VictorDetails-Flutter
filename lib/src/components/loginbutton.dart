import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFE30613),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
              child: Text(
            'Entrar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
        ),
      ),
    );
  }
}
