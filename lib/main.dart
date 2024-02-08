import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:math';
import "package:shake/shake.dart";

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(
          'Dice',
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        backgroundColor: Colors.red.shade900,
      ),
      drawer: Drawer(
        width: 100.0,
        child: drawerPage(),
      ),
      body: DicePage(),
    ),
  ));
}

int topDiceNumber = 1;
int bottomDiceNumber = 1;
var list = [];
String s = '';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    // build method is refreshed whenever a state change is detected,
    //  so it is better to keep variables outside build( declaration of variables) and the other things
    //  inside of build, like updation etc.
    // ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
    //   print('Shake detected');
    // });
    void change() {
      topDiceNumber = Random().nextInt(6) + 1;
      bottomDiceNumber = Random().nextInt(6) + 1;
      s = "$topDiceNumber | $bottomDiceNumber\n$s ";
    }

    return SafeArea(
      child: TextButton(
        onPressed: () {
          setState(() {
            change();
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Image.asset('images/dice$topDiceNumber.png'),
              ),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Expanded(
                child: Image.asset('images/dice$bottomDiceNumber.png'),
              ),
              Container(
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class drawerPage extends StatefulWidget {
  const drawerPage({super.key});

  @override
  State<drawerPage> createState() => _drawerPageState();
}

class _drawerPageState extends State<drawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "History",
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                  SizedBox(
                    width: 90.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "$s",
                    style: TextStyle(fontSize: 50, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 775,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    s = ' ';
                  });
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
