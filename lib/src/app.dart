import 'package:flutter/material.dart';
import 'package:login_bloc_library/src/core/routes/app_route.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Register',
      theme: ThemeData(
        primaryColor: Colors.teal[700]
      ),
      onGenerateRoute: AppRoute.routes,
    );
  }
}