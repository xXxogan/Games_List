import 'package:flutter/material.dart';

class GameImage extends StatelessWidget {
  const GameImage({super.key, required this.image, required this.fit});

  final String? image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image ?? "",
      fit: .contain,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset("assets/witcher.png", fit: fit);
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator();
      },
    );
  }
}
