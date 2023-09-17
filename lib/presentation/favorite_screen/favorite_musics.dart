import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/model/form_data.dart';
import 'package:music_app/model/music_model.dart';
import 'package:audioplayers/audioplayers.dart';

class FavoriteMusic extends StatefulWidget {
  final MusicCard musicCard;
  final int idx;
  const FavoriteMusic({required this.musicCard, required this.idx, super.key});

  @override
  State<FavoriteMusic> createState() => _FavoriteMusicState();
}

class _FavoriteMusicState extends State<FavoriteMusic>
    with TickerProviderStateMixin {
  final audioPlayer = AudioPlayer();
  bool isPlaying = true;
  bool isTurning = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.grey),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.play_arrow : Icons.pause,
                      color: Colors.white),
                  iconSize: 30,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer
                          .play(AssetSource(widget.musicCard.url!));
                    } else {
                      await audioPlayer.pause();
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                      isTurning = !isTurning;
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                isTurning
                    ? RotationTransition(
                        turns: animation,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(widget.musicCard.bgImage!),
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: AssetImage(widget.musicCard.bgImage!),
                        radius: 30,
                      ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pushNamed(context, '/songScreen',
                        arguments: FormDataa(
                            musicCard: widget.musicCard, index: widget.idx));
                    await audioPlayer.pause();
                    setState(() {
                      if (!isPlaying) isPlaying = true;
                      if (isTurning) isTurning = false;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.musicCard.title!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.musicCard.author!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
