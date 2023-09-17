import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/presentation/song_screen/bloc/song_state.dart';
import '../../../model/music_model.dart';

class SongCubit extends Cubit<SongState>{
  SongCubit() : super(SongState());

  void init() async {
    emit(state.copyWith(isLoading: true));
    final listMusic = await getMusic();
    emit(state.copyWith(isLoading: false, listMusic: listMusic));
  }

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


}