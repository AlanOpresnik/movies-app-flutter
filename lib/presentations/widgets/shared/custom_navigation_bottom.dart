import 'package:flutter/material.dart';

class CustomNavigationBottom extends StatelessWidget {
  const CustomNavigationBottom({super.key});

  @override
  Widget build(BuildContext context) {
  return NavigationBar(
    elevation: 0,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_max_outlined),
          label: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.label_outline),
          label: 'Categorías',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
