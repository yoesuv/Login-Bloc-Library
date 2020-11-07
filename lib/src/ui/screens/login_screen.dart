import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/core/bloc/login_bloc.dart';
import 'package:login_bloc_library/src/core/event/login_event.dart';
import 'package:login_bloc_library/src/core/state/login_state.dart';
import 'package:login_bloc_library/src/ui/shared/email_field.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _emailInput(),
              _PasswordField(),
              Container(margin: EdgeInsets.only(top: 20.0)),
              _LoginButton()
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
                  errorText: state.passwordError
              )
          );
        });
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            color: state.email.valid && state.password.valid ? Colors.teal : Colors.grey[400],
            borderRadius: BorderRadius.circular(8)
          ),
          child: MaterialButton(
            onPressed:  state.email.valid && state.password.valid ? (){
              print("Login Screen # login bibeh");
            } : null,
            child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        );
      },
    );
  }
}