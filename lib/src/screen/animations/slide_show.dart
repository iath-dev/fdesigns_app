import 'package:fdesigns_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SlideShow"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SlideShow(
              children: [
                SvgPicture.asset('assets/undraw_search.svg'),
                SvgPicture.asset('assets/undraw_my_app.svg'),
              ],
            ),
          ),
          Expanded(
            child: SlideShow(
              shape: BoxShape.rectangle,
              children: [
                SvgPicture.asset('assets/undraw_completed.svg'),
                SvgPicture.asset('assets/undraw_mobile_development.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
