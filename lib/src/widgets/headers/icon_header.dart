import 'package:flutter/material.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color fontColor;
  final List<Color> colors;

  const IconHeader(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.colors,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Background(
          colors: colors,
          fontColor: fontColor,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: Icon(
            icon,
            color: fontColor.withOpacity(0.25),
            size: 250,
          ),
        ),
        _HeaderTitle(title, subtitle, icon, fontColor),
        _TopButtons(fontColor: fontColor)
      ],
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color fontColor;

  const _HeaderTitle(this.title, this.subtitle, this.icon, this.fontColor);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 80),
          Text(
            title,
            style: TextStyle(color: fontColor),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: TextStyle(fontSize: 30, color: fontColor),
          ),
          const SizedBox(height: 12),
          Icon(
            icon,
            size: 80,
            color: fontColor,
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final List<Color> colors;
  final Color fontColor;

  const _Background({
    super.key,
    required this.colors,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: colors),
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(32)),
        ));
  }
}

class _TopButtons extends StatelessWidget {
  const _TopButtons({
    super.key,
    required this.fontColor,
  });

  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: fontColor,
              )),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: fontColor,
              ))
        ],
      ),
    );
  }
}
