import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/models/LoginModel.dart';
import 'package:riverpod_api/util/api_service/app_api_service.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final String message;
  LoginLoadedState({required this.message});
}

class LoginFailedState extends LoginState {
  final String message;
  LoginFailedState({required this.message});
}

class LoginNotifier extends StateNotifier<LoginState> {
  ApiService apiService = ApiService();
  LoginNotifier() : super(LoginInitialState());

  login(LoginModel model) async {
    state = LoginLoadingState();
    try {
      Map<String, dynamic> data = await apiService.loginThroughForm(
          LoginModel(email: model.email, password: model.password));
      if (data['Status'] == 'Login Successfully') {
        state = LoginLoadedState(message: 'SignInSuccessfully');
      } else {
        state = LoginFailedState(message: 'Something Went Wrong');
      }
    } catch (e) {
      state = LoginFailedState(message: e.toString());
    }
  }
}
