import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String urll;
  bool Daytime=true;
  WorldTime({required this.location, required this.flag, required this.urll});

  Future<void> getTime() async {
    try {
      Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/$urll');
      http.Response response = await http.get(url);

      Map Data = jsonDecode(response.body);
      //print(Data);
      String datetime = Data['datetime'];
      //print(datetime);
      String offset = Data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);
      Daytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught error: $e");
      time = "could not get time data";
    }
  }
}
