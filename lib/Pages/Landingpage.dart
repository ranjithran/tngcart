import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _networkstatus = false;
  Future<void> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('No Internet Connection?'),
        content: new Text('Do you want to exit'),
        actions: <Widget>[
          // new FlatButton(
          //   onPressed: () => _networkCheck,
          //   child: new Text('No'),
          // ),
          new FlatButton(
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: new Text('OK'),
          ),
        ],
      ),
    ));
  }

  void _networkCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi)) {
      _onWillPop();
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => NoNetworkPage()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  void initState() {
    super.initState();
    _networkCheck();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
