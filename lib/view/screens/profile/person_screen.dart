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
    return const Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      bottomNavigationBar: CustomNavBar(),
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}
