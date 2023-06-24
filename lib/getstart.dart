import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';

import 'package:weather_app/Home.dart';

class getstart extends StatefulWidget {
  const getstart({Key? key}) : super(key: key);

  @override
  State<getstart> createState() => _getstartState();
}

class _getstartState extends State<getstart> {
  late LocationData _currentPosition;
  var late;
  var long;

  Future<void> getLocation() async{
    if(await Permission.location.isGranted){
      _currentPosition = await Location().getLocation();
      // // pressure(_currentPosition);
      //   print("Location");
      print(_currentPosition.latitude);
      print(_currentPosition.longitude);

      setState(() {
        late = _currentPosition.latitude.toString();
        long = _currentPosition.longitude.toString();
      });

      String url ='https://api.openweathermap.org/data/2.5/weather?lat=$late&lon=$long&appid=ff0d0154a0fbf7736676e415048f620b';
//     print(url);
      var keys = 'ff0d0154a0fbf7736676e415048f620b';
      var response = await http.get (Uri.parse(url));
      if (response.statusCode == 200) {
        var mydata1 = await jsonDecode(response.body);
       print(response.body);
            Navigator.push(context, MaterialPageRoute(builder: (context) => weather()));
      }
      else {
        print('something went wrong');
      }
    }else{
      Permission.location.request();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child:
          Center(
            child: ElevatedButton(onPressed: () {
              getLocation();
            },
                child: Text('Get Started')),
          ),
        )
    );
  }
}

