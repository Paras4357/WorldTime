import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading....';


  void worldtime() async {
    WorldTime instance = WorldTime(location: 'America', flag: 'india.png', url: 'America/Mexico_City');
    await instance.getTime();
    Navigator. pushReplacementNamed(context, '/home', arguments: {
      'Location': instance.location,
      'Time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    worldtime();
  }
  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitThreeInOut(
            itemBuilder: (BuildContext context, int index) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
                ),
              );
            },
          ),
      ),
    );
  }
}
