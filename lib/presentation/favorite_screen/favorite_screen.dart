import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/presentation/favorite_screen/bloc/favorite_screen_bloc.dart';
import 'package:music_app/presentation/favorite_screen/bloc/favorite_screen_state.dart';
import 'package:music_app/presentation/favorite_screen/favorite_musics.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteScreenCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = FavoriteScreenCubit()..init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _cubit,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/img/avt.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Top Favorite ✨",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rubik',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<FavoriteScreenCubit, FavoriteScreenState>(
                    bloc: _cubit,
                    builder: (context, state) {
                      if (state.isLoading!) {
                        return const CircularProgressIndicator();
                      }
                      return SizedBox(
                        height: 550,
                        child: ListView.builder(
                          itemCount: state.listFavorite!.length,
                          itemBuilder: (context, index) {
                            return FavoriteMusic(
                                musicCard: state.listFavorite![index], idx: index);
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
