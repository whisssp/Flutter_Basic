import 'dart:ffi';

import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
  });

  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Colors.white
            )
        ),
        child: imageUrl == null || imageUrl == ""
          ? const Placeholder()
          : Image.asset(
            imageUrl!,
            width: width ?? 75,
            height: height ?? 75
          ),
      ),
    );
  }
}