
import 'package:flutter/material.dart';
import 'package:music_app/model/form_data.dart';

import 'package:music_app/presentation/song_screen/song_screen.dart';
import '../../../model/music_model.dart';


class DetailCard extends StatelessWidget {
  final MusicCard musicCard;
  final int idx;
  const DetailCard({required this.musicCard,required this.idx,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/songScreen',arguments: FormDataa(musicCard: musicCard, index: idx));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        width: MediaQuery.of(context).size.width*0.75,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(musicCard.bgImage!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                height: 50,
                width: MediaQuery.of(context).size.width*0.60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(musicCard.title!, style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rubik',
                          color: Colors.deepPurple.shade700,
                        ),),
                        Text(musicCard.author!, style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rubik',
                          color: Colors.deepPurple.shade700,
                        ),),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: (){

                      },
                      icon: const Icon(Icons.play_circle, size: 30,color: Colors.deepPurple,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
