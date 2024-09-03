import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/home_screen.dart';
import 'package:news/views/item_selected.dart';

void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ItemSelected.routeName: (_) => const ItemSelected(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
