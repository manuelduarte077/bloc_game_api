import 'package:bloc_api/routes/app_routes.dart';
import 'package:bloc_api/view/screens/screens.dart';
import 'package:bloc_api/view/widgets/custom_navbar.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameApp extends StatelessWidget {
  const GameApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.redHatDisplayTextTheme(),
      ),
      home: CustomNavBar(),
      initialRoute: LandingPage.routeName,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
