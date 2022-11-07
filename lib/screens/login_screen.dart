import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/app_providers/login_provider.dart';
import 'package:riverpod_api/main.dart';
import 'package:riverpod_api/screens/home_screen.dart';
import 'package:riverpod_api/widgeys/login_widgets.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          LoginUI(),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(loginProvider);
              if (state is LoginLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoginLoadedState) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                });

                return SizedBox();
              } else if (state is LoginFailedState) {
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
