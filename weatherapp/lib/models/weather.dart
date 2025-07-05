class Weather {
  final String cityName;
  final double temperature;
 final String description;
  final double humidity;
  final double wind;
  final int pressure;


  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.wind,
    required this.pressure,

  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
      pressure: json['main']['pressure'],
    );
  }
}
