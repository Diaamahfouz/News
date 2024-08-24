import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/categories_grid.dart';
import 'package:news/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
        ),
        drawer: HomeDrawer(),
        body: const CategoriesGrid(),
      ),
    );
  }
}
