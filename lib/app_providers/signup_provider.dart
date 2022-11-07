import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/models/SignUpModel.dart';
import 'package:riverpod_api/util/api_service/app_api_service.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpLoadedState extends SignUpState {
  final String message;

  SignUpLoadedState({required this.message});
}

class SignUpFailedState extends SignUpState {
  final String message;

  SignUpFailedState({required this.message});
}

class SignUpNotifier extends StateNotifier<SignUpState> {
  ApiService apiService = ApiService();

  SignUpNotifier() : super(SignUpInitialState());

  signupInitially() {
    state = SignUpInitialState();
  }

  signup(SignUpModel model) async {
    state = SignUpLoadingState();
    try {
      Map<String, dynamic> data = await apiService.signUpThroughForm(
          SignUpModel(
              email: model.email,
              password: model.password,
              displayName: model.displayName,
              loginBy: model.loginBy));
      if (data['Status'] == 'Client Inserted Successfully') {
        state = SignUpLoadedState(message: 'SignUp Successfully');
      } else {
        state = SignUpFailedState(message: 'Something Went Wrong');
      }
    } catch (e) {
      state = SignUpFailedState(message: e.toString());
    }
  }
}
