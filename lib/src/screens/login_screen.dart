import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/blocs/login_bloc.dart';
import 'package:login_bloc_library/src/blocs/login_event.dart';
import 'package:login_bloc_library/src/blocs/login_state.dart';
import 'package:login_bloc_library/src/models/email.dart';
import 'package:login_bloc_library/src/models/password.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _EmailField(),
              _PasswordField(),
              Container(margin: EdgeInsets.only(top: 20.0)),
              loginButton()
            ],
          ),
        )
    );
  }

  Widget loginButton() {
    return RaisedButton(
      onPressed: (){},
      child: Text('Login'),
      color: Colors.teal,
    );
  }

}

class _EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            key: const Key('login_email'),
            onChanged: (email) => context.bloc<LoginBloc>().add(EmailChanged(email)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'email@you.com',
              labelText: 'Email Address',
              errorText: errorTextEmail(state)
            )
          );
        });
  }

  String errorTextEmail(LoginState state) {
    if (state.email.invalid) {
      if (state.email.error == EmailStatus.empty) {
        return 'Email Is Empty';
      } else if (state.email.error == EmailStatus.not_valid) {
        return 'Email Is Not Valid';
      } else {
        return 'Email Invalid';
      }
    } else {
      return null;
    }
  }

}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextField(
              key: const Key('login_password'),
              onChanged: (password) => context.bloc<LoginBloc>().add(PasswordChanged(password)),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'your password',
                  labelText: 'Password',
                  errorText: errorTextPassword(state)
              )
          );
        });
  }

  String errorTextPassword(LoginState state) {
    if (state.password.invalid) {
      if (state.password.error == PasswordStatus.empty) {
        return 'Password Is Empty';
      } else if (state.password.error == PasswordStatus.min_char) {
        return 'Password Min 3 Character';
      } else {
        return 'Password Invalid';
      }
    } else {
      return null;
    }
  }

}