import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class _IconButton {
  final String label;
  final List<Color> colors;
  final IconData icon;

  _IconButton({required this.label, required this.colors, required this.icon});
}

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_IconButton> buttons = [
      _IconButton(
          label: "Medical Emergency",
          colors: [Colors.blue[700]!, Colors.blue[400]!],
          icon: Icons.local_hospital),
      _IconButton(
          label: "Car Accident",
          colors: [Colors.purple[700]!, Colors.purple[400]!],
          icon: Icons.car_crash),
      _IconButton(
          label: "Fire",
          colors: [Colors.red[700]!, Colors.red[400]!],
          icon: Icons.fire_extinguisher),
      _IconButton(
          label: "Earthquake",
          colors: [Colors.amber[700]!, Colors.amber[400]!],
          icon: Icons.map),
      _IconButton(
          label: "Bike Accident",
          colors: [Colors.cyan[700]!, Colors.cyan[400]!],
          icon: Icons.bike_scooter),
      _IconButton(
          label: "Theft",
          colors: [Colors.deepOrange[700]!, Colors.deepOrange[400]!],
          icon: Icons.money_off),
    ];

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 300),
              ...buttons.map((e) => FadeInLeft(
                    duration: const Duration(milliseconds: 300),
                    child: FadeOutButton(
                        label: e.label,
                        colors: e.colors,
                        color: Colors.white,
                        icon: e.icon,
                        onPress: () => null),
                  ))
            ],
          ),
          IconHeader(
              icon: Icons.local_hospital,
              title: "Haz solicitado",
              subtitle: "Asistencia medica",
              colors: [Colors.blue[400]!, Colors.blue[800]!],
              fontColor: Colors.white),
        ],
      ),
    );
  }
}
