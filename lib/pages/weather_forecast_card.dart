import "package:flutter/material.dart";
import 'package:flutter_app/pages/shimmer_box.dart';

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final String weatherIcon;
  final String temperature;
  final bool isLoading;

  const WeatherForecastCard({
    super.key,
    required this.time,
    required this.weatherIcon,
    required this.temperature,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final exactTime = DateTime.fromMillisecondsSinceEpoch(
      int.parse(time) * 1000,
    );
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: isLoading
            ? Column(
                children: [
                  ShimmerBox(width: 100, height: 10),
                  SizedBox(height: 8),
                  ShimmerBox(width: 40, height: 40),
                  SizedBox(height: 8),
                  ShimmerBox(width: 40, height: 14),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${exactTime.hour < 10 ? "0${exactTime.hour}" : exactTime.hour}:${exactTime.minute}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 8),
                  // Icon(icon, size: 32),
                  Image.network(
                    "https://openweathermap.org/payload/api/media/file/$weatherIcon.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  // SizedBox(height: 8),
                  Text(temperature),
                ],
              ),
      ),
    );
  }
}
