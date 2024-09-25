import 'package:flutter/material.dart';
import 'package:login_bloc_library/src/core/routes/app_route.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Register',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.teal,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute.routes,
    );
  }
}
