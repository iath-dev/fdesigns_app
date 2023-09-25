import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PieChartScreen extends StatelessWidget {
  const PieChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PieChart(),
      ),
    );
  }
}
