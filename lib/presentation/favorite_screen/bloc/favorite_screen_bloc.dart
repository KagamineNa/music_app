import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/presentation/favorite_screen/bloc/favorite_screen_state.dart';
import '../../../model/music_model.dart';

class FavoriteScreenCubit extends Cubit<FavoriteScreenState>{
  FavoriteScreenCubit() : super(FavoriteScreenState());

  Future<List<MusicCard>> getFavorite() async {
    try{
      final result = await rootBundle.loadString('assets/favorite_songs.json');
      final data = json.decode(result);
      List<MusicCard> listFavorite = List<MusicCard>.from(data.map((model)=> MusicCard.fromJson(model)));
      return listFavorite;
    }catch(e){
      rethrow;
    }
  }

  void init()async{
    emit(state.copyWith(isLoading: true));
    final listFavorite = await getFavorite();
    emit(state.copyWith(isLoading: false, listFavorite: listFavorite));
  }

}