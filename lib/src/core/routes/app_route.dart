import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/core/bloc/login_bloc.dart';
import 'package:login_bloc_library/src/ui/screens/login_screen.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          );
        }
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          );
        }
      );
    }
  }
}