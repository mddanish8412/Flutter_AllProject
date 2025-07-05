import 'package:flutter/material.dart';
import 'package:weather_apps/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 // Map<String,dynamic>? temp_data;

  String city = "New Delhi";
   late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;

  void startApp(String city) async
  {
    worker instance  = worker(city);
    await instance.getData();

    temp = instance.temp.toString();
    hum = instance.humidity.toString();
    air_speed = instance.air_speed.toString();
    des = instance.description.toString();
    main = instance.main.toString();
    icon = instance.icon.toString();


    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,
      } );
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    startApp(city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final search = ModalRoute.of(context)!.settings.arguments as Map;
    if(search.isNotEmpty)
    {
      city = search['searchText'];
    }
   // startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 180,),
              Image.asset("images/mlogo.png",height: 240,width: 240,),

              Text("Mausam App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),),
              SizedBox(height: 10,),
              Text("Made By Danish",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
              SizedBox(height: 30,),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],

    );
  }
}
