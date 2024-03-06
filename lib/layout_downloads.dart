import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appData.dart';

class LayoutDownloads extends StatefulWidget {
  const LayoutDownloads({Key? key}) : super(key: key);

  @override
  _LayoutDownloadsState createState() => _LayoutDownloadsState();
}

class _LayoutDownloadsState extends State<LayoutDownloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.6),
        body: Center(
          child: Text('Downloads'),
        ));
  }
}
