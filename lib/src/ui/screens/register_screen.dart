import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_library/src/core/bloc/register_bloc.dart';
import 'package:login_bloc_library/src/core/event/register_event.dart';
import 'package:login_bloc_library/src/core/state/register_state.dart';
import 'package:login_bloc_library/src/ui/shared/full_name_field.dart';

class RegisterScreen extends StatelessWidget {

  static const routeName = "register";

  @override
  Widget build(BuildContext context) {
    final RegisterBloc bloc = context.read<RegisterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _fullNameInput(bloc),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _fullNameInput(RegisterBloc bloc) {
  return BlocBuilder<RegisterBloc, RegisterState>(
    buildWhen: (previous, current) => previous.fullName != current.fullName,
    builder: (context, state) {
      return FullNameField(
        onChange: (fullName) => bloc.add(FullNameChanged(fullName)),
        errorMessage: state.fullNameError,
      );
    }
  );
}

