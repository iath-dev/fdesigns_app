import 'package:fdesigns_app/src/router/router.dart';
import 'package:fdesigns_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppTheme(), child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Designs",
      theme: appTheme.theme,
      darkTheme: appTheme.darkTheme,
      themeMode: appTheme.dark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
