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

class SignUpNotifier extends StateNotifier {
  ApiService apiService = ApiService();
  SignUpNotifier() : super(SignUpInitialState());

  signup(SignUpModel model) {
    state = SignUpLoadingState();
    try {
      apiService.signUpThroughForm(SignUpModel(email: model.email,password: model.password,displayName: model.displayName,loginBy: model.))
    }
    catch (e) {}
  }
}
