import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:android_intent/android_intent.dart';
import 'package:android_intent/flag.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:weather/weather.dart';


void main() {
  runApp(new AlarmWeather());
}

class AlarmWeather extends StatefulWidget {
  @override
  _AlarmWeatherState createState() => _AlarmWeatherState();
}

class _AlarmWeatherState extends State<AlarmWeather> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Project',
      home: MainPage(),
      routes: {
        '/page1': (context) => MainPage(),
        // '/page2': (context) => SecondPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curPageIndex = 0;
  String _weatherStr;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Alarm and Weather'),
      ),
      body: getPage(),
      floatingActionButton: getButton(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _curPageIndex = index;
          });
          if(index == 1) {
            getWeather();
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.alarm, size: 30,
            color: _curPageIndex == 0 ? Colors.blue : Colors.black54,),
              title: Text('Alarm', style: TextStyle(
                fontSize: 15,
                color: _curPageIndex == 0 ? Colors.blue : Colors.black54,),)),
          BottomNavigationBarItem(icon: Icon(Icons.wb_sunny, size: 30,
            color: _curPageIndex == 1 ? Colors.blue : Colors.black54,),
              title: Text('Weather', style: TextStyle(
                fontSize: 15,
                color: _curPageIndex == 1 ? Colors.blue : Colors.black54,),))
        ],
      ),
    );
  }

  Widget getPage() {
    Widget page;
    switch (_curPageIndex) {
      case 0:
        page = alarmPage();
        break;
      case 1:
        page = weatherPage();
        break;
    }
    return page;
  }

  FloatingActionButton getButton() {
    FloatingActionButton button;

    switch(_curPageIndex) {
      case 0:
        button = alarmAddButton();
        break;
      case 1:
        button = null;
        break;
    }
    return button;
  }

}

FloatingActionButton alarmAddButton() {
  return FloatingActionButton(
    tooltip: 'Add Alarm',
    child: Icon(Icons.alarm_add),
    onPressed: () {},
  );
}

ListView alarmPage() {
  return ListView(
    children: [
      Text('Empty ...'),
      Text('Empty ...'),
      Text('Empty ...'),
    ],
  );
}
Center weatherPage() {
  return Center(
    child: Text('Loading'),
  );
}




