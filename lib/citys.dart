import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:weather_app/Home.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';


class citys extends StatefulWidget {
  const citys({Key? key}) : super(key: key);

  @override
  State<citys> createState() => _citysState();
}

class _citysState extends State<citys> {
  String? selectedValue;
  final List<String> items = [
    'surat',
    'Baroda',
    'vapi',
    'Navsari',
    'Valsad'
  ];


  Future<void> getData(String $selectedValue) async {

    var key = 'ff0d0154a0fbf7736676e415048f620b';
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$selectedValue&appid=$key'));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>weather()));
    } else {
      print('something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/sky.jpg"), fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70,),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                    hint: Column(
                      children: [
                        Text('Select City',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).hintColor),),
                      ],

                    ),
                    items: items
                        .map((items) => DropdownMenuItem<String>(
                      value: items,
                      child: Text(items, style: TextStyle(fontSize: 20),),
                    )
                    ).toList(),
                  value: selectedValue,
                  onChanged: (value) {
                      print(value);

                      setState(() {
                        selectedValue = value;
                        // print(selectedValue);
                      });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 130
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: 35
                  ),
                ),
              ),SizedBox(height: 500,),
              ElevatedButton(onPressed: () {
                getData('value');
              },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
