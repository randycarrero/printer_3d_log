import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'Screen 2',
      style: TextStyle(color: Colors.blue, fontSize: 20),
    ));
  }
}
