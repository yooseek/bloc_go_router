import 'package:bloc_go_router/feature/auth/domain/auth_domain.dart';
import 'package:bloc_go_router/feature/auth/presentation/auth_presentation.dart';
import 'package:bloc_go_router/feature/sign/presentation/sign_presentation.dart';
import 'package:bloc_go_router/injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignView extends StatelessWidget {
  const SignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignBloc(authRepository: serviceLocator()),
      child: BlocBuilder<SignBloc, SignState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  const Text('sign!!!!!!!!!!!!!'),
                  const Text('login 하기!!!!!!!!!!!!!'),
                  TextField(
                    onSubmitted: (val) {
                      context.read<SignBloc>().add(SignInUsernameChanged(val));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
