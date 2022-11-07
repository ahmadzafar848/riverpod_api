import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/app_providers/album_provider.dart';
import 'package:riverpod_api/main.dart';
import 'package:riverpod_api/screens/screen_two.dart';
import 'package:riverpod_api/widgeys/home_screen_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(albumProvider.notifier).getAlbum();
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ScreenTwo();
          },
        ));
      }),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(albumProvider);
          if (state is AlbumInitialState) {
            return Center(
              child: Text('Press Button'),
            );
          } else if (state is AlbumLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumLoadedState) {
            return HomeScreenUI(state: state);
          } else if (state is AlbumFailedState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text('Riverpod Error'),
            );
          }
        },
      ),
    );
  }
}
