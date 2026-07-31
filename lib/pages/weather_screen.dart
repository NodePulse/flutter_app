import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/additional_info_card.dart';
import 'package:flutter_app/pages/weather_forecast_card.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  MainWeatherScreen createState() => MainWeatherScreen();
}

class MainWeatherScreen extends State<WeatherScreen>
    with SingleTickerProviderStateMixin {
  // double temperature = 0;
  // bool isLoading = false;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    handleRefresh();
    // getCurrentWeather();
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?lat=30.707630695949934&lon=76.68616447847324&appid=9579cf02c97e71fbddbae308e676bb4a",
        ),
      );

      final data = jsonDecode(res.body);
      if (data['cod'] != "200") {
        throw "An unexpected error occured!";
      }

      return data;

      // temperature = data['main']["temp"];
      // print(res.body);
    } catch (e) {
      throw e.toString();
    }
  }

  final currentHour = DateTime.now().hour;

  void handleRefresh() {
    print("Refresh");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return
    // Scaffold(
    //   // backgroundColor: Colors.red,
    //   appBar: AppBar(
    //     title: const Text(
    //       "Weather App",
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     centerTitle: true,
    //     actions: [
    //       IconButton(onPressed: handleRefresh, icon: const Icon(Icons.refresh)),
    //       // GestureDetector(
    //       //   onTap: handleRefresh,
    //       //   child: const Icon(Icons.refresh),
    //       // ),
    //     ],
    //   ),
    //   body:
    FutureBuilder(
      future: getCurrentWeather(),
      builder: (context, snapshot) {
        var isAdditionalInfoLoading = false;
        if (snapshot.connectionState == ConnectionState.waiting) {
          isAdditionalInfoLoading = true;
          // return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final data = snapshot.data!;
        final currentData = data["list"][0];
        final currentTemperature = currentData["main"]["temp"];
        final currentSky = currentData["weather"][0]["main"];
        final weatherIcon = currentData["weather"][0]["icon"];
        final currentHumidity = currentData["main"]["humidity"];
        final currentWindSpeed = currentData["wind"]["speed"];
        final currentPressure = currentData["main"]["pressure"];

        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              "$currentTemperature K",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Icon(Icons.cloud, size: 80),
                            Image.network(
                              "https://openweathermap.org/payload/api/media/file/$weatherIcon.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                            Text("$currentSky", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              const Text(
                "Weather Forecast",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data["cnt"],
                  itemBuilder: (context, index) {
                    return WeatherForecastCard(
                      time: data["list"][index]["dt"].toString(),
                      weatherIcon: data["list"][index]["weather"][0]["icon"]
                          .toString(),
                      temperature: data["list"][index]["main"]["temp"]
                          .toString(),
                      isLoading: isAdditionalInfoLoading,
                    );
                  },
                ),
              ),
              Text(
                "Additional Information",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionalInfoCard(
                    icon: Icons.water_drop,
                    label: "Humidity",
                    value: "$currentHumidity",
                    isloading: isAdditionalInfoLoading,
                  ),
                  AdditionalInfoCard(
                    icon: Icons.air,
                    label: "Wind Speed",
                    value: "$currentWindSpeed",
                    isloading: isAdditionalInfoLoading,
                  ),
                  AdditionalInfoCard(
                    icon: Icons.beach_access,
                    label: "Pressure",
                    isloading: isAdditionalInfoLoading,
                    value: "$currentPressure",
                  ),
                ],
              ),
            ],
          ),
        );
      },
      // ),
    );
  }
}
