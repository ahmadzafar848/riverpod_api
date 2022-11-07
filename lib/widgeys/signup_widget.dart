import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/models/SignUpModel.dart';

import '../main.dart';

class SignUpUI extends ConsumerWidget {
  SignUpUI({Key? key}) : super(key: key);
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController displayNameTextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          height: height * 0.1,
          child: Text(
            'SignUp Form',
            style: TextStyle(color: Colors.blue, fontSize: height * 0.03),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.12,
                width: width * 0.8,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name can not be Empty';
                    }
                    return null;
                  },
                  controller: displayNameTextEditingController,
                  decoration: InputDecoration(
                    helperText: '',
                    hintText: 'Display Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.12,
                width: width * 0.8,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email can not be Empty';
                    }
                    return null;
                  },
                  controller: emailTextEditingController,
                  decoration: InputDecoration(
                    helperText: '',
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.12,
                width: width * 0.8,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password can not be Empty';
                    }
                    if (value.length > 5) {
                      return null;
                    }
                    return 'mim len be 6 chars';
                  },
                  controller: passwordTextEditingController,
                  decoration: InputDecoration(
                    helperText: '',
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              ref.read(signUpProvider.notifier).signup(SignUpModel(
                  displayName: displayNameTextEditingController.text,
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text,
                  loginBy: '1'));
            }
          },
          child: Container(
            height: height * 0.07,
            width: width * 0.8,
            color: Colors.blue,
            child: Center(
              child: Text('Sign Up'),
            ),
          ),
        )
      ],
    ));
  }
}
