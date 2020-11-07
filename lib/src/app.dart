import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/core/bloc/login_bloc.dart';
import 'package:login_bloc_library/src/ui/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) {
              return LoginBloc();
          },
          child: LoginScreen(),
        ),
      ),
    );
  }
}