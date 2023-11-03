import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Weather {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      temperature: json['temperature'],
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
    );
  }
}

class MyApp extends StatelessWidget {
  final String jsonData = '''
    [
      {
        "city": "New York",
        "temperature": 20,
        "condition": "Clear",
        "humidity": 60,
        "windSpeed": 5.5
      },
      {
        "city": "Los Angeles",
        "temperature": 25,
        "condition": "Sunny",
        "humidity": 50,
        "windSpeed": 6.8
      },
      {
        "city": "London",
        "temperature": 15,
        "condition": "Partly Cloudy",
        "humidity": 70,
        "windSpeed": 4.2
      },
      {
        "city": "Tokyo",
        "temperature": 28,
        "condition": "Rainy",
        "humidity": 75,
        "windSpeed": 8.0
      },
      {
        "city": "Sydney",
        "temperature": 22,
        "condition": "Cloudy",
        "humidity": 55,
        "windSpeed": 7.3
      }
    ]
  ''';

  const MyApp({super.key});

  List<Weather> _parseWeatherData(String jsonString) {
    final List<dynamic> decoded = json.decode(jsonString);
    return decoded.map((dynamic json) => Weather.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Weather> weatherData = _parseWeatherData(jsonData);

    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Info App'),
          backgroundColor: Colors.cyan,
          centerTitle: false,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            Weather weather = weatherData[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  title: Text(weather.city),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature: ${weather.temperature}°C'),
                      Text('Condition: ${weather.condition}'),
                      Text('Humidity: ${weather.humidity}%'),
                      Text('Wind Speed: ${weather.windSpeed} m/s'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
