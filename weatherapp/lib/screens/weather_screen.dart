import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService weatherService = WeatherService();
  String city = "New Delhi";
  Map<String, dynamic>? weatherData;
  bool isLoading = false;

  // Fetch weather data
  Future<void> getWeather() async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await weatherService.fetchWeather(city);
      setState(() {
        weatherData = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Apps'),
        backgroundColor: Colors.cyan,

      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              // Search Bar
              const SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search city",
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (value) {
                  setState(() {
                    city = value;
                  });
                  getWeather();
                },
              ),
              const SizedBox(height: 25),
              // Weather Info
              if (isLoading)
                const CircularProgressIndicator(color: Colors.white)
              else if (weatherData != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // City Name
                      Row(
                        children: [
                          const Icon(Icons.location_pin, color: Colors.red),
                          const SizedBox(width: 5),
                          Text(
                            weatherData!['name'],
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Weather Cards
                      WeatherInfoCard(
                        icon: Icons.thermostat,
                        label: 'Temperature',
                        value: '${weatherData!['main']['temp']}°C',
                      ),
                      WeatherInfoCard(
                        icon: Icons.cloud,
                        label: 'Description',
                        value: '${weatherData!['weather'][0]['description']}',
                      ),
                      WeatherInfoCard(
                        icon: Icons.speed,
                        label: 'Wind',
                        value: '${weatherData!['wind']['speed']} kph',
                      ),
                      WeatherInfoCard(
                        icon: Icons.shutter_speed_outlined,
                        label: 'Pressure',
                        value: '${weatherData!['main']['pressure']} hpa',
                      ),
                      WeatherInfoCard(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: '${weatherData!['main']['humidity']}%',
                      ),
                      SizedBox(height: 180,),
                      Center(child: Text('This Apps Developed by Danish'),
                      ),
                    ],
                  ),
                )
              else
                const Text(
                  'Enter a city to get weather information',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Weather Info Card
class WeatherInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
