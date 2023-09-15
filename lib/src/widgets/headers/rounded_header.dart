import 'package:flutter/material.dart';

class HeaderRounded extends StatelessWidget {
  const HeaderRounded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
          ],
        ),
      ),
    );
  }
}
