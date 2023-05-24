import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/citys.dart';
import 'package:weather_app/grid.dart';

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  int Selected = 0;

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
                // showModalBottomSheet(
                //     context: context,
                //     builder: (context) =>
                //         Bottommodal());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/sky.jpg"), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Surat',
                  style: TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://previews.123rf.com/images/chudtsankov/chudtsankov1207/chudtsankov120700038/14510469-summer-hot-sun.jpg',
                      width: 90,
                      height: 90,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: '37\u2103',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 40,
                                  fontWeight: FontWeight.normal))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'sunny',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3))
                        ]))
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cloud,
                        )),
                    Text('70%'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.water_drop_outlined)),
                    Text('40%'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.wind_power,
                        )),
                    Text('3.5km/h'),
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
                                Text('35\u2103'),
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
                          style: TextStyle(color: Colors.blue, fontSize: 10),
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
                              Padding(padding: EdgeInsets.only(right: 115)),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '39\u2103 /',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16))
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '26\u2103 ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16))
                              ]))
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
