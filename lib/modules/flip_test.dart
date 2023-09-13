import 'package:chat_app/modules/register_screen.dart';
import 'package:flutter/material.dart';
import '../shared/constants/constants.dart';
import 'login_screen.dart';

class FlipableCardDemo extends StatefulWidget {
  const FlipableCardDemo({super.key});

  @override
  _FlipableCardDemoState createState() => _FlipableCardDemoState();
}

class _FlipableCardDemoState extends State<FlipableCardDemo>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void flipCard() {
    if (isFrontVisible) {
      animationController.forward();
    } else {
      animationController.reverse();
    }

    setState(() {
      isFrontVisible = !isFrontVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            final double rotationValue = animationController.value * 180.0;

            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(animationController.value * 360.0 * 0.0174533),
              alignment: Alignment.center,
              child: Container(
                width: 500.0,
                height: 700.0,
                child: isFrontVisible ? login() : register(),
              ),
            );
          },
        ),
      ),
    );
  }
}
