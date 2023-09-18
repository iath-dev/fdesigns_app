import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RadialProgressScreen extends StatefulWidget {
  const RadialProgressScreen({Key? key}) : super(key: key);

  @override
  State<RadialProgressScreen> createState() => _RadialProgressScreenState();
}

class _RadialProgressScreenState extends State<RadialProgressScreen> {
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            progress += 10;

            if (progress > 100) progress = 0;
            setState(() {});
          },
          child: const Icon(Icons.play_circle),
        ),
        appBar: AppBar(title: const Text("Barras de progreso")),
        body: GridView.count(
          crossAxisCount: 2,
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            RadialProgress(
              value: progress,
              color: Colors.amber,
              backgroundColor: Colors.amber[200],
            ),
            RadialProgress(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.red[200],
              stokeWidth: 20,
            ),
            RadialProgress(
              value: progress,
              color: Colors.blue,
              backgroundColor: Colors.blue[100],
              width: 5,
            ),
            RadialProgress(
              value: progress,
              color: Colors.green,
              backgroundColor: Colors.green[200],
              width: 10,
              stokeWidth: 10,
            ),
          ],
        ));
  }
}
