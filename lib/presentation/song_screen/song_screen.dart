import 'package:flutter/material.dart';
import 'package:music_app/model/form_data.dart';
import 'widgets/song_feature.dart';


class SongScreen extends StatefulWidget {
  const SongScreen({super.key});
  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {

  @override
  Widget build(BuildContext context) {

    final songs = ModalRoute.of(context)!.settings.arguments as FormDataa;

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(songs.musicCard.bgImage!),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              ShaderMask(
                  shaderCallback: (rect){
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.0),
                      ],
                      stops: const [0.0, 0.4, 0.7],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.deepPurple.shade200,
                            Colors.deepPurple.shade800,
                          ],
                        )
                    ),
                  )
              ),
              SongFeature(musicCard: songs.musicCard, idx: songs.index,),
            ],
          ),
        ],
      ),
    );
  }
}



