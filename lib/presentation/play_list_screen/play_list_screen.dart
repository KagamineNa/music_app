
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/presentation/play_list_screen/bloc/playlist_screen_bloc.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  bool isPlaying = true;
  late PlaylistScreenCubit _cubit;

  @override
  void initState(){
    super.initState();
    _cubit = PlaylistScreenCubit()..init();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>_cubit,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade800,
                Colors.deepPurple.shade200,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // child: Padding(
          //   padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          //   child: SingleChildScrollView(
          //     child: BlocBuilder(
          //       builder: (ctx,state){
          //
          //       },
          //     ),
          //   ),
          // )
        ),
      ),
    );
  }
}



