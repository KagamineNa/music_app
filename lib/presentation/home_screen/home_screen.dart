import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/presentation/home_page/bloc/home_page_bloc.dart';
import 'package:music_app/presentation/home_page/bloc/home_page_state.dart';
import '../../model/music_model.dart';
import 'widgets/music_small_card.dart';
import '../play_list_screen/widgets/play_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MusicCard> playlists = [];

  late HomePageCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = HomePageCubit()..init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _cubit,
      child: Container(
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
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/img/avt.jpg'),
                        radius: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enjoy Your Favorite Music",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Trending Music",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<HomePageCubit, HomePageState>(
                  bloc: _cubit,
                  builder: (ctx, state) {
                    if (state.isLoading!) {
                      return const CircularProgressIndicator();
                    }
                    return CarouselSlider.builder(
                      itemCount: state.listTrending!.length,
                      itemBuilder: (c, index, realIndex) {
                        return DetailCard(
                          musicCard: state.listTrending![index],
                          idx: index,
                        );
                      },
                      options: CarouselOptions(
                        height: 220,
                        autoPlay: true,
                        // reverse: true,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      "Playlists",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rubik',
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, '/playListScreen');
                      },
                      child: const Text(
                        "View more",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Rubik',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<HomePageCubit, HomePageState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    if (state.isLoading!) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: state.listMusicCard!.length,
                          itemBuilder: (c, index) {
                            return PlayList(
                              playList: state.listMusicCard![index],
                              idx: index,
                            );
                          }),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
