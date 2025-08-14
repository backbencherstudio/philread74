import 'package:flutter/material.dart';
import 'package:philread74/core/constant/images.dart';

class BackgroundScreen extends StatelessWidget {
       final Widget child;
  final bool useSafeArea;
  const BackgroundScreen({super.key,this.useSafeArea = true, required this.child});

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(AppImages.screenBackgroundSvg, fit: BoxFit.cover),
          ),

          /// Foreground Widget
          Positioned.fill(child: useSafeArea ? SafeArea(child: child) : child),
        ],
      ),
    );
  }
}