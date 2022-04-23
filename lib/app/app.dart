import 'package:bloc_api/routes/app_routes.dart';
import 'package:bloc_api/view/screens/screens.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: LandingPage.routeName,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
