import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/views/movie_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.to(() => MovieScreen());
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF1F1B2D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/image1.png"),
            ],
          ),
        ),
      ),
    );
  }
}