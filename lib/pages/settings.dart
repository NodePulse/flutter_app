import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Temprature"),
                    DropdownMenu(
                      menuStyle: MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        // filled: true,
                        // fillColor: Colors.red,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      hintText: "Select temperature type",
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: "C", label: "C"),
                        DropdownMenuEntry(value: "F", label: "F"),
                        DropdownMenuEntry(value: "K", label: "K"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
