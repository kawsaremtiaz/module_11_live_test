import 'package:flutter/material.dart';
import 'weather_model.dart';

class WeatherListScreen extends StatelessWidget {
  const WeatherListScreen({
    super.key,
    required this.weatherData,
  });

  final List<Weather> weatherData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}