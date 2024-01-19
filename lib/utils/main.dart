
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: const Center(child: Text('texto aqui')),
      bottomNavigationBar: NavigationBar(
        destinations: const [
        NavigationDestination(icon: Icon(Iconsax.car), label: 'Carros'),
        NavigationDestination(icon: Icon(Iconsax.task_square), label: 'agenda'),
        NavigationDestination(icon: Icon(Iconsax.shop), label: 'serviços'),
        NavigationDestination(icon: Icon(Iconsax.profile_circle), label: 'configuração'),
        ],
      )
    )
    );
  }
  }

  class HomePage extends StatelessWidget {
     const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(

      );
    }




  }
  