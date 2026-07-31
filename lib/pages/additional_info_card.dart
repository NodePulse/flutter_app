import "package:flutter/material.dart";
import 'package:flutter_app/pages/shimmer_box.dart';

class AdditionalInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isloading;

  const AdditionalInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Column(
            children: [
              ShimmerBox(
                height: 36,
                width: 36,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              SizedBox(height: 6),
              ShimmerBox(
                height: 14,
                width: 56,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              SizedBox(height: 6),
              ShimmerBox(
                height: 16,
                width: 24,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ],
          )
        : Column(
            children: [
              Icon(icon, size: 32),
              SizedBox(height: 6),
              Text(label),
              SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
  }
}
