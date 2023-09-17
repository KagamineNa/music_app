import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_app/presentation/home_page/home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (ctx)=>const HomePage())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/splash_bg.jpeg'),
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
              Positioned(
                top: MediaQuery.of(context).size.height*0.5 + 50,
                left: MediaQuery.of(context).size.width*0.5 - 50,
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: SpinKitChasingDots(
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("Welcome and Enjoy", style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
