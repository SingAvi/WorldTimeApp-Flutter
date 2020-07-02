import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
class Choose_Location extends StatefulWidget {
  @override
  _Choose_LocationState createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {

  List<WorldTime> locations = [
  WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Choose Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){},
              title: Text(locations[index].location),

            ),
          );
        }
      ),
      );
  }
}
