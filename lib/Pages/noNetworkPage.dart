import 'package:flutter/material.dart';

class NoNetworkPage extends StatefulWidget {
  @override
  _NoNetworkPageState createState() => _NoNetworkPageState();
}

class _NoNetworkPageState extends State<NoNetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: Center(child: Text("no internet"),),
      ),
    );
  }
}