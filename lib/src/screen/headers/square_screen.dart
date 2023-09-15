import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SquareScreen extends StatelessWidget {
  const SquareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SquareHeader(),
    );
  }
}
