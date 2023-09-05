import 'package:exam_1/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splesh extends StatelessWidget {
  const splesh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splash: Transform.scale(
            scale: 4,
            child: Container(
              height: 500,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2020/10/27/12/50/cat-5690627_1280.png"),
                    fit: BoxFit.fill),
              ),
              child: const CircularProgressIndicator(),
            ),
          ),
          nextScreen: HomePage(),
        ),
      ),
    );
  }
}
