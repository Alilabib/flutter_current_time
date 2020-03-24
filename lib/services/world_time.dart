import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location; //Location Name for The UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //end point to get time zone
  bool isDayTime; // true or false if daytime or not


  WorldTime({this.location, this.flag, this.url, });


  Future <void> getTime() async {

    try{

      // Make Request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //    print(offset);
      //    print(datetime);
      //    print(offset);
      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }catch(e){
      print('Caught error :  $e');
      time = 'could not get time date';
    }

  }

}

WorldTime instance = WorldTime(location: 'Cairo', flag: 'egypt.png',url: 'Africa/Cairo');