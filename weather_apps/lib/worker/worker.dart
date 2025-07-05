import 'package:http/http.dart';
import 'dart:convert';
class worker {
  String location;
  Map<String,dynamic>? temp_data;

  //Constructor
  worker(this.location) {
    location = location;
  }
 late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  //method
  Future<void> getData() async
  {
    dynamic response = await get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9421c075b4aded6b62b00fae072e9ce2")); // Your response here

  if (response != null && response is Map<dynamic, dynamic>) {
  Map<dynamic, dynamic> mapResponse = response as Map<dynamic, dynamic>;
  // Now you can safely use mapResponse
  } else {
  // Handle the null case or the case where response is not a Map
  print("Response is null or not a Map");
  }


    try {
      Response response = await get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9421c075b4aded6b62b00fae072e9ce2"));
      Map data = jsonDecode(response.body) as Map<String,dynamic>;

        print(data);
      //Getting Temp,Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'];
      double getTemp = temp_data['temp'] - 273.15;

//Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"] / 0.27777777777778;
      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];

      //Assigning Values
      temp = getTemp as String; //C
      humidity = getHumidity as String; // %
      air_speed = getAir_speed as String; //km/hr
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data["icon"].toString();
    }
    catch (e)
    {
      print(e);
      temp = "NA";
      humidity = "Not Found";
      air_speed = "Not found";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
    }
  }
}
