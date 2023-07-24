import 'package:flutter/material.dart';

class ImageWithTopShadowWidget extends StatelessWidget {
  const ImageWithTopShadowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('bg.jpg', )
      ],
    );
  }
}
