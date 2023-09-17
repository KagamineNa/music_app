
import 'package:flutter/material.dart';
import 'package:music_app/presentation/home_screen/home_screen.dart';
import 'package:music_app/presentation/profile_screen/profile_screen.dart';
import '../favorite_screen/favorite_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> body =[
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body[_currentIndex],
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade800,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              duration: const Duration(milliseconds: 900),
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.deepPurple.shade800,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundGradient: LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.deepPurple.shade200,
                ],
              ),
              tabBorderRadius: 15,
              gap: 8,
              onTabChange: (newIndex){
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              tabs: [
                GButton(
                  icon: _currentIndex==0 ? Icons.home : Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: _currentIndex==1 ? Icons.favorite : Icons.favorite_outline,
                  text: 'Favorite',
                ),
                GButton(
                  icon: _currentIndex==2 ? Icons.person : Icons.person_outline,
                  text: 'Profile',
                ),

              ],
            ),
          ),
        ),
    );
  }
}




