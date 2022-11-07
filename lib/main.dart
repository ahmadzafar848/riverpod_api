import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/app_providers/album_provider.dart';
import 'package:riverpod_api/screens/home_screen.dart';

final albumProvider =
    StateNotifierProvider<AlbumNotifier, AlbumState>((ref) => AlbumNotifier());

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
