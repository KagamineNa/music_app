import 'package:flutter/material.dart';
import 'package:music_app/model/form_data.dart';
import '../../../model/music_model.dart';


class PlayList extends StatelessWidget {
  final MusicCard playList;
  final int idx;
  const PlayList({required this.playList, required this.idx,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/songScreen',arguments: FormDataa(musicCard: playList, index: idx));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(playList.bgImage!),
              radius: 30,
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(playList.title!, style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),),
                const SizedBox(height: 5,),
                Text(playList.author!, style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Rubik',
                  color: Colors.white,
                ),),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.play_circle_fill, size: 30, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
