import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const routName = '/favorites';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FavoritesScreen(),
      settings: const RouteSettings(name: routName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('FavoritesScreen'),
      ),
    );
  }
}
