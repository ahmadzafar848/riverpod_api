import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/app_providers/album_provider.dart';
import 'package:riverpod_api/app_providers/login_provider.dart';
import 'package:riverpod_api/screens/login_screen.dart';

final albumProvider =
    StateNotifierProvider<AlbumNotifier, AlbumState>((ref) => AlbumNotifier());

final loginProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) => LoginNotifier());

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
