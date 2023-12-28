import 'package:flutter/material.dart';
import 'package:flutter_inheritedwidget_example/color_card_widget.dart';
import 'package:flutter_inheritedwidget_example/color_widget.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color = Colors.red;

  void onColorChange() {
    setState(() {
      color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorWidget(
        color: color,
        onColorChange: onColorChange,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Column with Two Containers'),
          ),
          body: ColorCardWidget(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: color,
            onPressed: () {
              onColorChange();
            },
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }
}
