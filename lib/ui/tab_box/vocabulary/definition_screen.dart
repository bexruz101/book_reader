import 'package:flutter/material.dart';

class DefScreen extends StatelessWidget {
  const DefScreen({super.key, required this.txt});

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            Text(txt),

          ],
        ),
      ),
    );
  }
}
