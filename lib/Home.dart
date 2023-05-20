import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/citys.dart';
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
          IconButton(onPressed: () {},
              icon: Icon(Icons.light_mode,
              color: Colors.black,)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        Bottommodal());
              },
              icon: Icon(Icons.add))
          // PopupMenuButton(
          //     icon: Icon(Icons.settings),
          //     itemBuilder: (context)=>[
          //       PopupMenuItem(child: Text('Select City'),),
          //     ]
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/sky.jpg"),
                fit: BoxFit.fill),
              ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Surat',style: TextStyle(fontSize: 30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network('https://previews.123rf.com/images/chudtsankov/chudtsankov1207/chudtsankov120700038/14510469-summer-hot-sun.jpg',width: 90,height: 90,),
                      Row(
                        children: [
                          RichText(text: TextSpan(
                              children: [
                                TextSpan(text: '37\u2103', style: TextStyle(color: Colors.yellow,fontSize: 40,fontWeight: FontWeight.normal))
                              ]
                          )),
                          RichText(text: TextSpan(
                              children: [
                                TextSpan(text: 'sunny', style: TextStyle(color: Colors.yellow,fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 3))
                              ]
                          ))
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: () {},
                          icon: Icon(Icons.cloud,)),Text('70%'),
                      IconButton(onPressed: () {},
                          icon: Icon(Icons.water_drop_outlined)),Text('40%'),
                      IconButton(onPressed: () {},
                          icon: Icon(Icons.wind_power,)),Text('3.5km/h'),
                    ],
                  ),
                  Divider(thickness: 1,),
                  SizedBox( height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context,int index) {
                      return Container(
                        padding: EdgeInsets.all(11),
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                             Text ('${index+1} AM',),
                              Icon(Icons.sunny,color: Colors.yellowAccent,size: 50,),
                              Text('35\u2103'),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 5,),
                  Divider(thickness: 1,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Next 7 Days',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: () {},
                        child: Text('View all',style: TextStyle(color: Colors.blue,fontSize: 10),))
                  ],),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (BuildContext contaxt, int index) {

                        var days = DateFormat('EEEE').format(DateTime.now().add(Duration(days:index + 1)));

                        return Card(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                            child: Row(
                              children: [
                                Text('$days'),
                                IconButton(onPressed: () {}, icon: Icon(Icons.sunny,color: Colors.yellow,size: 20,)),
                                Text('36\u2103'),
                                Padding(padding: EdgeInsets.only(right: 115)),

                                RichText(text: TextSpan(
                                    children: [TextSpan(
                                        text: '39\u2103 /', style: TextStyle(color: Colors.black,fontSize: 16)
                                    )]
                                )),
                                RichText(text: TextSpan(
                                    children: [TextSpan(
                                        text: '26\u2103 ', style: TextStyle(color: Colors.grey,fontSize: 16)
                                    )]
                                ))
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
  Widget Bottommodal() {
    return Container(
      height: 300,

      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
                  children: [
                    Text('Select Your One Cities',style: TextStyle(fontSize: 20),),
                    Divider(thickness: 3,),
                    RadioListTile(
                      title: Text('Ahmedabad'),
                      value: 1,
                      groupValue: Selected,
                      onChanged: (value){
                        setState(() {
                          Selected = 1 ;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    RadioListTile(
                      title: Text('surat'),
                      value: 2,
                      groupValue: Selected,
                      onChanged: (value) {
                        setState(() {
                          Selected = 2;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    RadioListTile(
                      title: Text('Vadodara'),
                      value: 3,
                      groupValue: Selected,
                      onChanged: (value){
                        setState(() {
                          Selected = 3;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    RadioListTile(
                      title: Text('Rajkot'),
                      value: 4,
                      groupValue: Selected,
                      onChanged: (value){
                        setState(() {
                          Selected = 4;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    RadioListTile(
                      title: Text('Bhavnagar'),
                      value: 5,
                      groupValue: Selected,
                      onChanged: (value){
                        setState(() {
                          Selected = 5;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    RadioListTile(
                      title: Text('Jamnagar'),
                      value: 6,
                      groupValue: Selected,
                      onChanged: (value){
                        setState(() {
                          Selected = 6;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    RadioListTile(
                        title: Text('Gandhinagar'),
                        value: 7,
                        groupValue: Selected,
                        onChanged: (value) {
                      setState(() {
                        Selected = 7;
                      });
                        }),
                    RadioListTile(
                        title: Text('Junagadh'),
                        value: 8,
                        groupValue: Selected,
                        onChanged: (value) {
                      setState(() {
                        Selected = 8;
                      });
                        })
                    // SingleChildScrollView(child: city(Colors.black, 'Ahmedabad')),
                    // city(Colors.black, 'Surat'),
                    // city( Colors.black, 'Vadodara',),
                    // city( Colors.black, 'Rajkot',),
                    // city( Colors.black, 'Bhavnagar',),
                    // city( Colors.black, 'Jamnagar',),
                    // city( Colors.black, 'Gandhinagar',),
                    // city( Colors.black, 'Junagadh',),
                    // city( Colors.black, 'Gandhidham',),

                        // 10.	Anand	47.89	385,291	288,092
                        // 11.	Navsari	43.716	367,322	292,719
                        // 12.	Morbi	46.58	360,001	251,859
                        // 13.	Nadiad	45.16	330,400	225,071
                        // 14.	Surendranagar	58.60	298,692	253,606
                        // 15.	Bharuch	43.80	288,244	223,647
                        // 16.	Mehsana	31.76	257,043	190,753
                        // 17.	Bhuj	39.79	251,489	219,514
                        // 18.	Porbandar	50.48	243,584	217,203
                        // 19.	Palanpur	39.50	242,936	141,532
                        // 20.	Valsad	24.10	231,756	170,060
                        // 21.	Vapi	31.35	230,598	163,630
                        // 22.	Gondal	74.48	189,797	173,353
                        // 23.	Veraval	39.95	185,797	156,696
                        // 24.	Godhra	20.16	173,014	143,644
                        // 25.	Patan	17.82	171,614	133,744
                        // 26.	Kalol	25.42	171,395	133,737
                        // 27.	Dahod	14.00	159,326	130,505
                        // 28.	Botad	10.36	158,985	130,327
                        // 29.	Amreli	65.00	146,014	117,967
                        // 30.	Deesa	20.81	135,869	111,160
                        // 31.	Jetpur)
                  ],
            ),
          ),
        ),
      ),
    );
  }

  Widget city(color, text,) {
    return Column(
      children: [
        Text(text),
      ],
    );
  }

}
