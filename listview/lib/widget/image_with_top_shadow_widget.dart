import 'package:flutter/material.dart';

class ImageWithTopShadowWidget extends StatelessWidget {
  const ImageWithTopShadowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('asset/bg.jpg', fit: BoxFit.cover),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pink, Colors.transparent],
            ),
          ),
        ),
      ],
    );
  }
}
