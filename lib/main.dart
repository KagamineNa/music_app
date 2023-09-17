import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_app/api/firebase_api.dart';
import 'package:music_app/presentation/edit_screen/edit_screen.dart';
import 'package:music_app/presentation/home_page/home_page.dart';
import 'package:music_app/presentation/play_list_screen/play_list_screen.dart';
import 'package:music_app/presentation/song_screen/song_screen.dart';
import 'package:music_app/presentation/splash_screen/splash_screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      routes: <String, WidgetBuilder>{
        '/' : (ctx)=> const SplashScreen(),
        '/homePage': (ctx)=> const HomePage(),
        '/playListScreen' : (ctx)=> const PlayListScreen(),
        '/songScreen' : (ctx)=> const SongScreen(),
        '/editScreen' : (ctx)=>const EditScreen(),
      },
    );
  }
}



