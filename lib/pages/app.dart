import 'package:flutter/material.dart';
import 'package:flutter_app/pages/weather_screen.dart';
import 'package:flutter_app/pages/settings.dart';

class WeatherMainApp extends StatefulWidget {
  const WeatherMainApp({super.key});

  @override
  State<WeatherMainApp> createState() => _WeatherMainAppState();
}

class _WeatherMainAppState extends State<WeatherMainApp> {
  int _selectedIndex = 0;
  final GlobalKey<MainWeatherScreen> _weatherKey =
      GlobalKey<MainWeatherScreen>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? "Weather App" : "Settings"),
        actions: [
          if (_selectedIndex == 0)
            IconButton(
              onPressed: () {
                _weatherKey.currentState?.handleRefresh();
              },
              icon: Icon(Icons.refresh),
            ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
            selectedIcon: Icon(Icons.home_outlined),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
            selectedIcon: Icon(Icons.settings_outlined),
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          WeatherScreen(key: _weatherKey),
          SettingsScreen(),
        ],
      ),
    );
  }
}
