import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Australia/Sydney'   ,location: 'Sydney'     ,flag: 'australia.png'),
    WorldTime(url: 'America/Belize'     ,location: 'Brazil'     ,flag: 'brazil.png'),
    WorldTime(url: 'America/Toronto'    ,location: 'Canada'     ,flag: 'canada.png'),
    WorldTime(url: 'Asia/Tokyo'         ,location: 'China'      ,flag: 'china.png'),
    WorldTime(url: 'Africa/Cairo'       ,location: 'Egypt'      ,flag: 'egypt.png'),
    WorldTime(url: 'Europe/Vienna'      ,location: 'Europe'     ,flag: 'europe.png'),
    WorldTime(url: 'Europe/Paris'       ,location: 'France'     ,flag: 'france.png'),
    WorldTime(url: 'Europe/Berlin'      ,location: 'Germany'    ,flag: 'germany.png'),
    WorldTime(url: 'Europe/Athens'      ,location: 'Greece'     ,flag: 'greece.png'),
    WorldTime(url: 'Asia/Dili'          ,location: 'India'      ,flag: 'india.png'),
    WorldTime(url: 'Asia/Hong_Kong'     ,location: 'Indonessia' ,flag: 'indonesia.png'),
    WorldTime(url: 'Europe/Rome'        ,location: 'Italy'      ,flag: 'italy.png'),
    WorldTime(url: 'Africa/Nairobi'     ,location: 'Kenya'      ,flag: 'kenya.png'),
    WorldTime(url: 'America/Mexico_City',location: 'Mexico'     ,flag: 'mexico.png'),
    WorldTime(url: 'Europe/Amsterdam'   ,location: 'Nether'     ,flag: 'nether.png'),
    WorldTime(url: 'Europe/Prague'      ,location: 'Portugal'   ,flag: 'portugal.png'),
    WorldTime(url: 'Europe/Moscow'      ,location: 'Russia'     ,flag: 'russia.png'),
    WorldTime(url: 'Asia/Baku'          ,location: 'South Korea',flag: 'south_korea.png'),
    WorldTime(url: 'Europe/Madrid'      ,location: 'Spain'      ,flag: 'spain.png'),
    WorldTime(url: 'Europe/London'      ,location: 'UK'         ,flag: 'uk.png'),
    WorldTime(url: 'America/Chicago'    ,location: 'USA'        ,flag: 'usa.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context,{
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.5,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
        ) ,
    );
  }
}
