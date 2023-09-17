import '../../../model/music_model.dart';

class FavoriteScreenState {
  FavoriteScreenState({this.isLoading = false, this.listFavorite});
  final bool? isLoading;
  final List<MusicCard>? listFavorite;

  FavoriteScreenState copyWith({
    bool? isLoading,
    List<MusicCard>? listFavorite,
  }) {
    return FavoriteScreenState(
      isLoading: isLoading ?? this.isLoading,
      listFavorite: listFavorite ?? this.listFavorite,
    );
  }
}
