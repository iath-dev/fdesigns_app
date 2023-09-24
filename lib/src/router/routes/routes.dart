import 'package:fdesigns_app/src/models/models.dart';
import 'package:fdesigns_app/src/screen/screen.dart';
import 'package:flutter/material.dart';

final List<NavItem> headersRoutes = [
  NavItem(
      path: "square",
      screen: const SquareScreen(),
      label: "Cuadrado",
      icon: Icons.square_rounded),
  NavItem(
      path: "circle",
      screen: const CircleScreen(),
      label: "Redondo",
      icon: Icons.circle),
  NavItem(
      path: "sharp",
      screen: const SharpScreen(),
      label: "Sharp",
      icon: Icons.polyline),
  NavItem(
      path: "diagonal",
      screen: const DiagonalScreen(),
      label: "Diagonal",
      icon: Icons.polyline_outlined),
  NavItem(
      path: "pick",
      screen: const PickScreen(),
      label: "Pico",
      icon: Icons.edit),
  NavItem(
      path: "curve",
      screen: const CurveScreen(),
      label: "Curva",
      icon: Icons.circle_outlined),
  NavItem(
      path: "waves",
      screen: const WavesScreen(),
      label: "Waves",
      icon: Icons.waves),
];

final List<NavItem> animationsHeaders = [
  NavItem(
      path: 'animation',
      screen: const AnimationScreen(),
      icon: Icons.play_arrow,
      label: 'Animaciones'),
  NavItem(
      path: 'animation-square',
      screen: const AnimationSquareScreen(),
      icon: Icons.play_circle,
      label: 'Cuadrado Animado'),
  NavItem(
      path: 'radial-progress',
      screen: const RadialProgressScreen(),
      icon: Icons.rotate_90_degrees_ccw,
      label: 'Progreso Radial'),
  NavItem(
      path: 'slideshow',
      screen: const SlideShowScreen(),
      icon: Icons.slideshow,
      label: 'SlideShow'),
];
