import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/core/bloc/login_bloc.dart';
import 'package:login_bloc_library/src/core/event/login_event.dart';
import 'package:login_bloc_library/src/core/state/login_state.dart';
import 'package:login_bloc_library/src/ui/shared/button_primary.dart';
import 'package:login_bloc_library/src/ui/shared/email_field.dart';
import 'package:login_bloc_library/src/ui/shared/password_field.dart';
import 'package:login_bloc_library/src/utils/app_helper.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _emailInput(),
              _passwordInput(),
              Container(margin: EdgeInsets.only(top: 20.0)),
              _loginButton()
            ],
          ),
        )
    );
  }

  Widget _emailInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return EmailField(
            onChange: (email) => context.bloc<LoginBloc>().add(EmailChanged(email)),
            errorMessage: state.emailError,
        );
    });
  }

  Widget _passwordInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
          return PasswordField(
              onChange: (password) => context.bloc<LoginBloc>().add(PasswordChanged(password)),
              errorMessage: state.passwordError
          );
      }
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ButtonPrimary(
          enable: state.email.valid && state.password.valid,
          onPress: () {
            showToastSuccess('Submit Login');
          },
          text: 'Login'
        );
      });
  }

}