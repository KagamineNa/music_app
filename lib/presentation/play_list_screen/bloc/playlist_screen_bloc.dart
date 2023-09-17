import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/model/music_model.dart';
import 'package:music_app/presentation/play_list_screen/bloc/playlist_screen_state.dart';

class PlaylistScreenCubit extends Cubit<PlaylistScreenState>{
  PlaylistScreenCubit() : super(PlaylistScreenState());

  Future<List<MusicCard>> getList(String source)async{
    final result = await rootBundle.loadString(source);
    final data = json.decode(result);
    List<MusicCard> listMusic = List<MusicCard>.from(data.map((model)=> MusicCard.fromJson(model)));
    return listMusic;
  }

  void init()async{
    emit(state.copyWith(isLoading: true, isPlaying: true));
    final list = await getList("assets/list_songs.json");
    emit(state.copyWith(isLoading: false, playLists: list));
  }

  void change()async{

  }

}