import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/core/bloc/login_bloc.dart';
import 'package:login_bloc_library/src/core/event/login_event.dart';
import 'package:login_bloc_library/src/core/state/login_state.dart';
import 'package:login_bloc_library/src/ui/screens/register_screen.dart';
import 'package:login_bloc_library/src/ui/shared/button_primary.dart';
import 'package:login_bloc_library/src/ui/shared/email_field.dart';
import 'package:login_bloc_library/src/ui/shared/password_field.dart';
import 'package:login_bloc_library/src/utils/app_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              _emailInput(),
              _passwordInput(),
              SizedBox(height: 20),
              _loginButton(),
              SizedBox(height: 20),
              _toRegister(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return EmailField(
          onChange: (email) => _bloc.add(
            EmailChanged(email),
          ),
          errorMessage: state.emailError,
        );
      },
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return PasswordField(
          onChange: (password) => _bloc.add(
            PasswordChanged(password),
          ),
          errorMessage: state.passwordError,
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ButtonPrimary(
          enable: state.status,
          onPress: () {
            showToastSuccess('Submit Login');
          },
          text: 'Login',
        );
      },
    );
  }

  Widget _toRegister(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RegisterScreen.routeName);
        },
        child: Text('Register', style: TextStyle(fontSize: 14)),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.teal[700];
            } else {
              return Colors.black;
            }
          }),
        ),
      ),
    );
  }
}
