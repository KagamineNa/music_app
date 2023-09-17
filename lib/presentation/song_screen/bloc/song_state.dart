import 'package:music_app/model/music_model.dart';

class SongState {
  SongState({
    this.isLoading = false,
    this.listMusic,
    this.isPlaying = false,
    this.isLooping = false,
    this.addFavor = false,
  });

  final bool isLoading;
  final List<MusicCard>? listMusic;
  final bool isPlaying;
  final bool isLooping;
  final bool addFavor;

  SongState copyWith({
    bool? isLoading,
    List<MusicCard>? listMusic,
    bool? isPlaying,
    bool? isLooping,
    bool? addFavor,
  }) {
    return SongState(
      isLoading: isLoading ?? this.isLoading,
      listMusic: listMusic?? this.listMusic,
      isPlaying: isPlaying ?? this.isPlaying,
      isLooping: isLooping ?? this.isLooping,
      addFavor: addFavor ?? this.addFavor,
    );
  }
}
