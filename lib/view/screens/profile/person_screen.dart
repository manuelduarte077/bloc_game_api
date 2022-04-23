import 'package:bloc_api/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  static const routName = '/person';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const PersonScreen(),
      settings: const RouteSettings(name: routName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const CustomNavBar(),
      body: const Center(
        child: Text('PersonScreen'),
      ),
    );
  }
}
