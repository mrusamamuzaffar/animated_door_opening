import 'package:animated_door_opening/animated_fold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Door Opening',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedDoor(),
    );
  }
}

class AnimatedDoor extends StatelessWidget {
  AnimatedDoor({Key? key}) : super(key: key);

  final _foldingCellKey = GlobalKey<AnimatedFoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFddba9e),
        body: Center(
          child: FittedBox(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF965D30),
                    width: 40,
                  ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 1, top: 1, bottom: 1),
                    child: AnimatedFold(
                      key: _foldingCellKey,
                      frontWidget: GestureDetector(
                        onTap: () => _foldingCellKey.currentState?.toggleFold(),
                        child: const Image(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/wooden_door.png'),
                        ),
                      ),
                      animationDuration: const Duration(milliseconds: 1000),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: Container(
                      height: 50,
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFF965D30),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    child: Container(
                      height: 50,
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFF965D30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

