import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:weather_app/Home.dart';
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
                      setState(() {
                        selectedValue = value as String;
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>weather()));
              },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
