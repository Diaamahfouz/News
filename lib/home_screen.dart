import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/categories_grid.dart';
import 'package:news/category/category_details.dart';
import 'package:news/category/category_model.dart';

import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/news_response/news.dart';
import 'package:news/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? searchTerm;
  bool isSearching = false;
  late final News news;
  TextEditingController searchController = TextEditingController();

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
        appBar: isSearching ? searchAppBar() : appBar(),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoryDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(onCategorySelected: onCategorySelected)
                : const SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedDrawerItem = drawerItem;
    setState(() {});
    Navigator.of(context).pop();
    selectedCategory = null;
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  searchAppBar() {
    return AppBar(
      title: TextField(
        controller: searchController,
        style: const TextStyle(color: AppTheme.white),
        cursorColor: AppTheme.white,
        decoration: const InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: AppTheme.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            isSearching = false;
            searchTerm = null;
            searchController.text = "";
          });
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              searchTerm = searchController.text;
            });
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  appBar() {
    return AppBar(
      title: const Text('News App'),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isSearching = true;
            });
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
