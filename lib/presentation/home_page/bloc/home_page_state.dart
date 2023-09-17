import '../../../model/music_model.dart';

class HomePageState {
  HomePageState({
    this.isLoading = false,
    this.listMusicCard,
    this.listTrending,
  });
  final bool? isLoading;
  final List<MusicCard>? listMusicCard;
  final List<MusicCard>? listTrending;

  HomePageState copyWith({
    bool? isLoading,
    List<MusicCard>? listMusicCard,
    List<MusicCard>? listTrending,
  }) {
    return HomePageState(
      isLoading: isLoading ?? this.isLoading,
      listMusicCard: listMusicCard?? this.listMusicCard,
      listTrending: listTrending?? this.listTrending,
    );
  }

}
