import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:flutter/material.dart';
import 'package:climate/screens/loading_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Time(currentTime: 5, sunriseTime: 2, sunsetTime: 7,),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Time extends StatefulWidget {
  final currentTime;
  final sunsetTime;
  final sunriseTime;
  final String currentDate = DateTime.now().toString();

  Time(
      {
        this.currentTime,
        this.sunriseTime,
        this.sunsetTime});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  //Shows either Sun or Moon Icon depending on Time of selected Location
  chooseTime() {
    if (widget.currentTime > widget.sunriseTime &&
        widget.currentTime < widget.sunsetTime) {
      return DecoratedIcon(
        icon: Icon(Icons.sunny, size: 26, color: Colors.amber),
        decoration: IconDecoration(
          shadows: [
            Shadow(
              blurRadius: 8,
              color: Colors.amber.shade700,
            ),
          ],
        ),
      );
    } else {
      return DecoratedIcon(
        icon: Icon(Icons.nightlight_round_sharp, size: 26, color: Colors.white),
        decoration: IconDecoration(
          shadows: [
            Shadow(blurRadius: 6, color: Colors.white),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        chooseTime(),
        SizedBox(
          width: 10,
        ),
        //Displays
        Text(
          "${DateFormat.jm().format(DateTime.now())}",
        ),
      ],
    );
  }
}



