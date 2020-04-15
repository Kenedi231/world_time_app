import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';
  Map data = {};

  void setupWorldTime(instance) {
    instance.getTime().then((onValue) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      });
    });
    
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    if (data != null) {
      setupWorldTime(WorldTime(flag: data['flag'], location: data['location'], url: data['url']));
    } else {
      setupWorldTime(WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'));
    }

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitRipple(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}