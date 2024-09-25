import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/core/bloc/register_bloc.dart';
import 'package:login_bloc_library/src/core/event/register_event.dart';
import 'package:login_bloc_library/src/core/state/register_state.dart';
import 'package:login_bloc_library/src/ui/shared/button_primary.dart';
import 'package:login_bloc_library/src/ui/shared/email_field.dart';
import 'package:login_bloc_library/src/ui/shared/full_name_field.dart';
import 'package:login_bloc_library/src/ui/shared/password_field.dart';
import 'package:login_bloc_library/src/utils/app_helper.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register";

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<RegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              _fullNameInput(),
              _emailInput(),
              _passwordInput(),
              _confirmPasswordInput(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              _registerButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _fullNameInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.fullName != current.fullName,
      builder: (context, state) {
        return FullNameField(
          onChange: (fullName) => _bloc.add(FullNameChanged(fullName)),
          errorMessage: state.fullNameError,
        );
      },
    );
  }

  Widget _emailInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return EmailField(
          onChange: (email) => _bloc.add(EmailChanged(email)),
          errorMessage: state.emailError,
        );
      },
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return PasswordField(
          onChange: (password) => _bloc.add(RegisterPasswordChanged(password)),
          errorMessage: state.passwordError,
        );
      },
    );
  }

  Widget _confirmPasswordInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: _bloc,
      buildWhen: (previous, current) =>
          previous.passwordConfirm != current.passwordConfirm,
      builder: (context, state) {
        return PasswordField(
          onChange: (password) => _bloc.add(
            RegisterConfirmPasswordChanged(password),
          ),
          errorMessage: state.passwordConfirmError,
          isConfirmPassword: true,
        );
      },
    );
  }

  Widget _registerButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ButtonPrimary(
          enable: state.status,
          onPress: () {
            showToastSuccess("Submit Register");
          },
          text: "Register",
        );
      },
    );
  }
}
