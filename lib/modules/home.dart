import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.brightness_4_outlined,
              )
          ),
        ],
      ),
    );
  }
}
