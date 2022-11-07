import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/main.dart';
import 'package:riverpod_api/models/LoginModel.dart';
import 'package:riverpod_api/screens/signup_screen.dart';

class LoginUI extends ConsumerWidget {
  LoginUI({Key? key}) : super(key: key);
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
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
            'LoginForm',
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
              ref.read(loginProvider.notifier).login(LoginModel(
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text));
            }
          },
          child: Container(
            height: height * 0.07,
            width: width * 0.8,
            color: Colors.blue,
            child: Center(
              child: Text('Login'),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          height: height * 0.1,
          child: Center(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: GestureDetector(
                  onTap: () {
                    ref.read(signUpProvider.notifier).signupInitially();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ));
                  },
                  child: Text(
                    'For SignUp,Click Here',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
