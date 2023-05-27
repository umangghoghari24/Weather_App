import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/citys.dart';
import 'package:weather_app/grid.dart';
import 'package:http/http.dart' as http;


class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  int Selected = 0;
  var mydata;
  var  main, icon, temp, pressure, temp_max, temp_min, speed;
  bool show = true;

  var image;


  Future<void> getData() async {
    var citys = city.text;
    var key = 'ff0d0154a0fbf7736676e415048f620b';
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=surat&appid=$key'));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      setState(() {
        mydata = data ;
         image = data['list'][0]['weather'][0]['icon'].toString();
      });
   //   print(mydata["list"][0]["weather"][0]["icon"]);
       print('https://api.openweathermap.org/img/w/$image.png');
    } else {
      print('something went wrong');
    }
  }

  TextEditingController city = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   getData();
  }

  Widget build(BuildContext context) {

    var date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text('$date'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.light_mode,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) => citys()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/weatherbg.jpg"),
                fit: BoxFit.fitHeight
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Surat',
                  style: TextStyle(fontSize: 30,color: Colors.white),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Visibility(
                        visible: image!=null,
                        child: SizedBox(
                          width: 500,
                            child: Image.network('https://api.openweathermap.org/img/w/$image.png',)),
                      ),
                    ),
                  //  Icon(Icons.sunny,size: 65,color: Colors.yellow,),
                    // Image.network(
                    //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxpv_PoTqYZ_bu9KiwaxRmBt1jK4Y4s6BvDw&usqp=CAU',
                    //   width: 90,
                    //   height: 90,
                    // ),
                    Row(
                      children: [
                        Text(
                          mydata!=null? mydata['list'][0]['main']['temp'].toString():'',
                          style:
                          TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        // RichText(
                        //     text: TextSpan(children: [
                        //   TextSpan(
                        //       text: '37\u2103',
                        //       style: TextStyle(
                        //           color: Colors.yellow,
                        //           fontSize: 40,
                        //           fontWeight: FontWeight.normal))
                        // ])),
                        // RichText(
                        //     text: TextSpan(children: [
                        //   TextSpan(
                        //       text: 'sunny',
                        //       style: TextStyle(
                        //           color: Colors.yellow,
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.bold,
                        //           letterSpacing: 3))
                        // ]))
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Visibility(
                    //       visible: image!=null,
                    //       child: SizedBox(
                    //         height: 50,width: 50,
                    //           child: Image.network('https://api.openweathermap.org/img/w/$image.png')),
                    //     ),
                    // ),
                    //  Text(
                    //   mydata!=null? mydata['weather']['icon'].toString():'',
                    //   style:
                    //   TextStyle(fontSize: 16, color: Colors.black),
                    // ),
                  //  Text('70%'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.water_drop_outlined),color: Colors.white
                    ),
                    // Text('40%'),
                    Text(
                      mydata!=null? mydata['list'][0]['main']['pressure'].toString():'',
                      style:
                      TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.wind_power,color: Colors.white
                        )),
                   // Text('3.5km/h'),
                    Text(
                      mydata!=null? mydata['list'][0]['wind']['speed'].toString():'',
                      style:
                      TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        var hourlyData;
                    //    var hourlyData = DateFormat().add_jm();
                    //     var times  = DateFormat.jm().
                    //     format(DateTime.fromMicrosecondsSinceEpoch(hourlyData.list[index].add_dt!.toInt()));
                        return Container(
                          padding: EdgeInsets.all(11),
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  '${index + 1} AM',
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: Colors.yellowAccent,
                                  size: 50,
                                ),
                                Text(
                                  mydata!=null? mydata['list'][0]['main']['temp'].toString():'',
                                  style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                                )
                              //  Text('35\u2103'),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next 7 Days',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ))
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (BuildContext contaxt, int index) {
                      var days = DateFormat('EEEE').format(
                          DateTime.now().add(Duration(days: index + 1)));

                      return Card(
                          child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: Row(
                            children: [
                              Text('$days'),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.sunny,
                                    color: Colors.yellow,
                                    size: 20,
                                  )),
                              Text('36\u2103'),
                              Padding(padding: EdgeInsets.only(right: 100)),
                              Column(
                                children: [
                                  Text('Max'),
                                  Text(
                                    mydata!=null? mydata['list'][0]['main']['temp_max'].toString():'',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                              Text('/'),
                              Column(
                                children: [
                                  Text('Min'),
                                  Text(
                                    mydata!=null? mydata['list'][0]['main']['temp_min'].toString():'',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                              // RichText(
                              //     text: TextSpan(children: [
                              //   TextSpan(
                              //       text: '39\u2103 /',
                              //       style: TextStyle(
                              //           color: Colors.black, fontSize: 16))
                              // ])),
                              // RichText(
                              //     text: TextSpan(children: [
                              //   TextSpan(
                              //       text: '26\u2103 ',
                              //       style: TextStyle(
                              //           color: Colors.grey, fontSize: 16))
                              // ]))
                            ],
                          ),
                        ),
                      ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
