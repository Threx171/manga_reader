import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appData.dart';

class LayoutExtensions extends StatefulWidget {
  const LayoutExtensions({Key? key}) : super(key: key);

  @override
  _LayoutExtensionsState createState() => _LayoutExtensionsState();
}

class _LayoutExtensionsState extends State<LayoutExtensions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.6),
        body: Center(
          child: Text('Extensions'),
        ));
  }
}
