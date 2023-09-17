import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/model/form_data.dart';
import 'package:music_app/presentation/song_screen/bloc/song_bloc.dart';
import 'package:music_app/presentation/song_screen/bloc/song_state.dart';
import '../../../model/music_model.dart';

class SongFeature extends StatefulWidget {
  late MusicCard musicCard;
  late int idx;
  SongFeature({required this.musicCard, required this.idx, super.key});

  @override
  State<SongFeature> createState() => _SongFeatureState();
}

class _SongFeatureState extends State<SongFeature>
    with TickerProviderStateMixin {
  late SongCubit _cubit;

  // List<MusicCard> playlists = [
  //   MusicCard(
  //       bgImage: 'assets/img/play1.jpg',
  //       title: 'Que Boi',
  //       author: 'Feng Timo',
  //       url: 'audios/que_boi.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play2.jpg',
  //       title: 'No More Goodbye',
  //       author: 'Unknown',
  //       url: 'audios/no_more_goodbye.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play3.jpg',
  //       title: 'Xem La Giac Mo',
  //       author: 'Chu Bin',
  //       url: 'audios/xem_la_giac_mo.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play4.jpg',
  //       title: 'Day Bien',
  //       author: 'Nhat Chi Luu Lien',
  //       url: 'audios/day_bien.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play5.jpg',
  //       title: 'River Flower In You',
  //       author: 'Yiruma',
  //       url: 'audios/canon_inD.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play6.jpg',
  //       title: "I'll Do It",
  //       author: 'Heidi Montag',
  //       url: "audios/i'll_do_it.mp3"),
  //   MusicCard(
  //       bgImage: 'assets/img/play7.jpg',
  //       title: "Grand Escape",
  //       author: 'Shinkai',
  //       url: 'audios/grand_escape.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play8.jpg',
  //       title: "Call Me On My Phone",
  //       author: 'puppi & Wheelie',
  //       url: "audios/call_me_on_my_phone.mp3"),
  //   MusicCard(
  //       bgImage: 'assets/img/play9.png',
  //       title: "We don't talk anymore",
  //       author: 'Charlie Puth',
  //       url: 'audios/we_dont_talk.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play10.png',
  //       title: "Bang Khuang",
  //       author: 'Justatee',
  //       url: 'audios/bang_khuang.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play11.png',
  //       title: "Kimino Na Wa",
  //       author: 'Shinkai',
  //       url: 'audios/kiminonawa.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play12.png',
  //       title: "Mai Mai Ben Nhau",
  //       author: 'Noo Phuoc Thinh',
  //       url: 'audios/mai_mai_ben_nhau.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play13.png',
  //       title: "Dau Mua",
  //       author: 'Trung Quan',
  //       url: 'audios/dau_mua.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play14.png',
  //       title: "DayDreams",
  //       author: 'Soobin',
  //       url: 'audios/day_dream.mp3'),
  //   MusicCard(
  //       bgImage: 'assets/img/play15.jpg',
  //       title: "Light Switch",
  //       author: 'Charlie Puth',
  //       url: 'audios/light_switch.mp3'),
  // ];

  // StreamController<bool> playing = StreamController();
  // StreamController<bool> looping = StreamController();
  // StreamController<bool> favour = StreamController();

  late AnimationController controller;
  late Animation<double> animation;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _cubit = SongCubit()..init();
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    // playing.sink.add(false);
    // looping.sink.add(false);
    // favour.sink.add(false);
    playSong();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();

    //Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //Listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    audioPlayer.onPlayerComplete.listen((_) {
      if (widget.idx == _cubit.state.listMusic!.length - 1) {
        Navigator.pushNamed(context, '/songScreen',
            arguments:
                FormDataa(musicCard: _cubit.state.listMusic![0], index: 0));
      } else {
        Navigator.pushNamed(context, '/songScreen',
            arguments: FormDataa(
                musicCard: _cubit.state.listMusic![widget.idx + 1],
                index: widget.idx + 1));
      }
      // if (widget.idx == playlists.length - 1) {
      //   Navigator.pushNamed(context, '/songScreen',
      //       arguments: FormDataa(musicCard: playlists[0], index: 0));
      // } else {
      //   Navigator.pushNamed(context, '/songScreen',
      //       arguments: FormDataa(
      //           musicCard: playlists[widget.idx + 1], index: widget.idx + 1));
      // }
    });
  }

  Future playSong() async {
    await audioPlayer.play(AssetSource(widget.musicCard.url!));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _cubit,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<SongCubit, SongState>(
          bloc: _cubit,
          builder: (ctx, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (!state.isLoading && state.listMusic == null) {
              return const Text("No Data, Loading False");
            } else if (!state.isLoading && state.listMusic!.isEmpty) {
              return const Text("Empty Data");
            }
            return Stack(children: [
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: 20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            Navigator.pushNamed(context, '/homePage');
                            dispose();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage:
                              const AssetImage('assets/img/disk.png'),
                          child: RotationTransition(
                            turns: animation,
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  AssetImage(widget.musicCard.bgImage!),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.musicCard.title!,
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.musicCard.author!,
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);
                        },
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            formatTime(position),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            formatTime(duration - position),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Rubik',
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (state.addFavor == false) {
                                _cubit.emit(state.copyWith(addFavor: true));
                              } else {
                                _cubit.emit(state.copyWith(addFavor: false));
                              }
                            },
                            icon: Icon(
                              _cubit.state.addFavor
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          // StreamBuilder(
                          //   stream: favour.stream,
                          //   builder: (ctx, snapshot) {
                          //     return IconButton(
                          //       onPressed: () {
                          //         if (snapshot.data == false) {
                          //           favour.sink.add(true);
                          //         } else {
                          //           favour.sink.add(false);
                          //         }
                          //       },
                          //       icon: Icon(
                          //         snapshot.data!
                          //             ? Icons.favorite
                          //             : Icons.favorite_outline,
                          //         color: Colors.white,
                          //         size: 20,
                          //       ),
                          //     );
                          //   },
                          // ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(
                                Icons.skip_previous,
                                color: Colors.deepPurple,
                              ),
                              iconSize: 30,
                              onPressed: () {
                                setState(() async {
                                  if (widget.idx == 0) {
                                    Navigator.pushNamed(context, '/songScreen',
                                        arguments: FormDataa(
                                            musicCard: state.listMusic![
                                                state.listMusic!.length - 1],
                                            index:
                                                state.listMusic!.length - 1));
                                    // arguments: FormDataa(
                                    //     musicCard:
                                    //     playlists[playlists.length - 1],
                                    //     index: playlists.length - 1));
                                  } else {
                                    Navigator.pushNamed(context, '/songScreen',
                                        arguments: FormDataa(
                                            musicCard: state
                                                .listMusic![widget.idx - 1],
                                            index: widget.idx - 1));
                                    // arguments: FormDataa(
                                    //     musicCard: playlists[widget.idx - 1],
                                    //     index: widget.idx - 1));
                                  }
                                  await audioPlayer.pause();
                                });
                              },
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: IconButton(
                              icon: state.isPlaying
                                  ? const Icon(
                                Icons.play_arrow,
                                color: Colors.deepPurple,
                              )
                                  : const Icon(
                                Icons.pause,
                                color: Colors.deepPurple,
                              ),
                              iconSize: 30,
                              onPressed: () async {
                                if (state.isPlaying) {
                                  await audioPlayer.play(
                                      AssetSource(widget.musicCard.url!));
                                } else {
                                  await audioPlayer.pause();
                                }
                                if (state.isPlaying == false) {
                                  _cubit.emit(state.copyWith(isPlaying: true));
                                } else {
                                  _cubit.emit(state.copyWith(isPlaying: false));
                                }
                              },
                            ),
                          ),
                          // StreamBuilder(
                          //     stream: playing.stream,
                          //     builder: (ctx, snapshot) {
                          //       return CircleAvatar(
                          //         backgroundColor: Colors.white,
                          //         radius: 25,
                          //         child: IconButton(
                          //           icon: snapshot.data!
                          //               ? const Icon(
                          //                   Icons.play_arrow,
                          //                   color: Colors.deepPurple,
                          //                 )
                          //               : const Icon(
                          //                   Icons.pause,
                          //                   color: Colors.deepPurple,
                          //                 ),
                          //           iconSize: 30,
                          //           onPressed: () async {
                          //             if (snapshot.data!) {
                          //               await audioPlayer.play(
                          //                   AssetSource(widget.musicCard.url!));
                          //             } else {
                          //               await audioPlayer.pause();
                          //             }
                          //             if (snapshot.data == false) {
                          //               playing.sink.add(true);
                          //             } else {
                          //               playing.sink.add(false);
                          //             }
                          //           },
                          //         ),
                          //       );
                          //     }),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.deepPurple,
                              ),
                              iconSize: 30,
                              onPressed: () {
                                setState(() async {
                                  if (widget.idx ==
                                      state.listMusic!.length - 1) {
                                    Navigator.pushNamed(context, '/songScreen',
                                        arguments: FormDataa(
                                            musicCard: state.listMusic![0],
                                            index: 0));
                                  } else {
                                    Navigator.pushNamed(context, '/songScreen',
                                        arguments: FormDataa(
                                            musicCard: state
                                                .listMusic![widget.idx + 1],
                                            index: widget.idx + 1));
                                  }
                                  // if (widget.idx == playlists.length - 1) {
                                  //   Navigator.pushNamed(context, '/songScreen',
                                  //       arguments: FormDataa(
                                  //           musicCard: playlists[0], index: 0));
                                  // } else {
                                  //   Navigator.pushNamed(context, '/songScreen',
                                  //       arguments: FormDataa(
                                  //           musicCard: playlists[widget.idx + 1],
                                  //           index: widget.idx + 1));
                                  // }
                                  await audioPlayer.pause();
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.loop,
                              color: state.isLooping
                                  ? Colors.deepPurpleAccent
                                  : Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              if (state.isLooping == false) {
                                _cubit.emit(state.copyWith(isLooping: true));
                                audioPlayer
                                    .setReleaseMode(ReleaseMode.loop);
                              } else {
                                _cubit.emit(state.copyWith(isLooping: false));
                                audioPlayer
                                    .setReleaseMode(ReleaseMode.release);
                              }
                            },
                          ),
                          // StreamBuilder(
                          //   stream: looping.stream,
                          //   builder: (ctx, snapshot) {
                          //     return IconButton(
                          //       icon: Icon(
                          //         Icons.loop,
                          //         color: snapshot.data!
                          //             ? Colors.deepPurpleAccent
                          //             : Colors.white,
                          //         size: 20,
                          //       ),
                          //       onPressed: () {
                          //         if (snapshot.data == false) {
                          //           looping.sink.add(true);
                          //           audioPlayer
                          //               .setReleaseMode(ReleaseMode.loop);
                          //         } else {
                          //           looping.sink.add(false);
                          //           audioPlayer
                          //               .setReleaseMode(ReleaseMode.release);
                          //         }
                          //       },
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}
