import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appData.dart';

class LayoutRead extends StatefulWidget {
  const LayoutRead({Key? key}) : super(key: key);

  @override
  _LayoutReadState createState() => _LayoutReadState();
}

class _LayoutReadState extends State<LayoutRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.6),
        body: Center(
          child: Text('Read'),
        ));
  }
}
