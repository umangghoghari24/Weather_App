import 'package:flutter/material.dart';
class gird extends StatefulWidget {
  const gird({Key? key}) : super(key: key);

  @override
  State<gird> createState() => _girdState();
}

class _girdState extends State<gird> {
  TextEditingController city= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
          Row(
            children: [
              SizedBox(width: 30,),
              Container(
                height: 50,
                  width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(30, 30),),
                  color: Colors.grey
                ),
                child: TextFormField(
                  onTap: () {},
                  controller: city,
                  decoration: InputDecoration(
                    hintText: 'Enter location',
                    border: InputBorder.none,
                    prefixIcon: IconButton(onPressed: () {},
                        icon: Icon(Icons.search))
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: Text('Cancle'))
            ],
          ),
          SizedBox(height: 40,),
          SizedBox(width: 330,child: Text('Populur cities',style: TextStyle(color: Colors.grey),),),
          Gridview(),
        ],
      ),
    );
  }
   Widget Gridview() {
    return Expanded(
      flex: 1,
        child: GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 10,
      primary: false,
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
          childAspectRatio: 2.5,
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),

          children: <Widget>[
         TextButton(style: TextButton.styleFrom(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
           backgroundColor: Colors.grey.shade200,),onPressed: () {},
     child: Padding(
       padding: const EdgeInsets.all(7.5),
       child: Row(
     children: [
       Text('location'),
     Icon(Icons.location_on)
     ],
     ),
     )
         ),
            TextButton(onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.teal
                ),
                child: Text('surat',style: TextStyle(color: Colors.black,),)),
            TextButton(onPressed: () {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.teal
                ),
                child: Text('Bharuch',style: TextStyle(color: Colors.black,),)),
            TextButton(onPressed: () {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.teal
                ),
                child: Text('Baroda',style: TextStyle(color: Colors.black,),)),
            
          ],
    ));
   }
}
