import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/util/api_service/app_api_service.dart';

import '../models/AlbumModel.dart';

@immutable
abstract class AlbumState {}

class AlbumInitialState extends AlbumState {}

class AlbumLoadingState extends AlbumState {}

class AlbumLoadedState extends AlbumState {
  final List<AlbumModel> list;
  AlbumLoadedState({required this.list});
}

class AlbumFailedState extends AlbumState {
  final String message;
  AlbumFailedState({required this.message});
}

////////////////////////////////////////////

class AlbumNotifier extends StateNotifier<AlbumState> {
  AlbumNotifier() : super(AlbumInitialState());
  ApiService apiService = ApiService();

  getAlbum() async {
    state = AlbumLoadingState();
    try {
      List<AlbumModel> list = await apiService.fetchAlbum();
      state = AlbumLoadedState(list: list);
    } catch (e) {
      state = AlbumFailedState(message: e.toString());
    }
  }
}
