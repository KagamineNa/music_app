
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/music_model.dart';
import 'home_page_state.dart';
import 'dart:convert';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState());

  Future<List<MusicCard>> getMusic() async {
    try {
      final result = await rootBundle.loadString('assets/list_songs.json');
      final data = json.decode(result);
      List<MusicCard> listMusic = List<MusicCard>.from(data.map((model)=> MusicCard.fromJson(model)));
      return listMusic;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MusicCard>> getTrendingMusic() async {
    try {
      final result = await rootBundle.loadString('assets/trending_songs.json');
      final data = json.decode(result);
      List<MusicCard> listMusic = List<MusicCard>.from(data.map((model)=> MusicCard.fromJson(model)));
      return listMusic;
    } catch (e) {
      rethrow;
    }
  }



  void init() async {
    emit(state.copyWith(isLoading: true));
    final lists = await getMusic();
    final trend = await getTrendingMusic();
    emit(state.copyWith(isLoading: false, listMusicCard: lists, listTrending: trend));
  }

}
