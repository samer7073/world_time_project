import 'package:flutter/material.dart';
import 'package:flutter_time_world_application/services/world_time.dart';

class ChooseLoading extends StatefulWidget {
  const ChooseLoading({super.key});

  @override
  State<ChooseLoading> createState() => _ChooseLoadingState();
}

class _ChooseLoadingState extends State<ChooseLoading> {
  List<WorldTime> locations = [
    WorldTime(urll: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urll: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urll: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urll: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urll: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urll: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urll: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urll: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(urll: 'Africa/Tunis', location: 'Tunis', flag: 'Tunisia.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      "url": instance.urll,
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "Daytime": instance.Daytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                  /*
                  Navigator.pushReplacementNamed(context, '/home', arguments: {
                    "url": locations[index].urll,
                    "location": locations[index].location,
                    "flag": locations[index].flag
                  });
                  */
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            );
          }),
    );
  }
}
