import '../../../model/music_model.dart';

class PlaylistScreenState {
  final bool? isPlaying;
  final bool? isLoading;
  List<MusicCard>? playLists;
  List<MusicCard>? favoriteLists;
  PlaylistScreenState({
    this.isLoading = false,
    this.isPlaying,
    this.playLists,
    this.favoriteLists,
  });

  PlaylistScreenState copyWith({
    bool? isPlaying,
    bool? isLoading,
    List<MusicCard>? playLists,
    List<MusicCard>? favoriteLists,
  }) {
    return PlaylistScreenState(
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      playLists: playLists?? this.playLists,
      favoriteLists: favoriteLists?? this.favoriteLists,
    );
  }

}
