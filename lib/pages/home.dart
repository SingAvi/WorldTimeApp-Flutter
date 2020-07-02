import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['dayOrNight'] ? 'day.jpg' : 'night1.jpg';
    Color bgColor = data['dayOrNight'] ? Colors.blueAccent : Colors.black;
    Color textColor = data['dayOrNight'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Global Time'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: ()
                {
                  Navigator.pushNamed(context, '/location');
                },

                icon:Icon(Icons.edit_location,
                color: Colors.grey,),
                label: Text('Change Location',
                  style: TextStyle(color: textColor),
                    ),

              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                Text(data['location'],
                  style: TextStyle(
                    color: textColor,
                    letterSpacing: 3.0,
                    fontSize: 28.0,
                ),),
              ],),
              SizedBox(height: 20.0,),
              Text(data['time'],
                style: TextStyle(
                  color: textColor,
                  fontSize: 18.0,
                  letterSpacing: 2.0,
                ),),
            ],
          ),
      ),
        ),)
    );
  }
}
