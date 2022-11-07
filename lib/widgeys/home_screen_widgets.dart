import 'package:flutter/material.dart';
import 'package:riverpod_api/app_providers/album_provider.dart';

class HomeScreenUI extends StatelessWidget {
  HomeScreenUI({Key? key, required this.state}) : super(key: key);
  AlbumLoadedState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                state.list[index].id.toString(),
              ),
            ),
            title: Center(
              child: Text(
                state.list[index].title.toString(),
              ),
            ),
            trailing: Text(state.list[index].userId.toString()),
          ),
        );
      },
    );
  }
}
