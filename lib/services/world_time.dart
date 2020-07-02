import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String time;
  String location;
  String flag;
  String url;
  bool isDayOrNight ;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      //Get Properties (Time is in UTC ,so actual time = DateTime+offset)
      String dateTime = data['datetime'];
      String dateOffsetHours = data['utc_offset'].substring(1,3);
      String dateOffsetMinutes = data['utc_offset'].substring(4,6);

      // Formatting into DataFormat
      DateTime now = DateTime.parse(dateTime);
      // Adding the offset to the Datetime
      now = now.add(Duration(hours:int.parse(dateOffsetHours),minutes:int.parse(dateOffsetMinutes) ));

      isDayOrNight = now.hour > 6 && now.hour < 18 ? true : false;
      //set time property
      time = DateFormat.jm().format(now);
    }
    catch(e)
    {
     time = 'Time could not be fetched..' ;
    }


  }



}
