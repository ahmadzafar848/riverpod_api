import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/app_providers/signup_provider.dart';
import 'package:riverpod_api/main.dart';
import 'package:riverpod_api/screens/login_screen.dart';
import 'package:riverpod_api/widgeys/signup_widget.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SignUpUI(),
          Consumer(
            builder: (_, ref, __) {
              final state = ref.watch(signUpProvider);
              if (state is SignUpInitialState) {
                return SizedBox();
              } else if (state is SignUpLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SignUpLoadedState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                });

                return SizedBox();
              } else if (state is SignUpFailedState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                });
                return SizedBox();
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
