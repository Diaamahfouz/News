import 'package:flutter/material.dart';

import 'package:news/shared/app_theme.dart';
import 'package:news/categories/view/widgets/categories_grid.dart';
import 'package:news/categories/view/widgets/category_details.dart';
import 'package:news/categories/data/models/category_model.dart';

import 'package:news/home/view/widgets/home_drawer.dart';

import 'package:news/news/data/models/news.dart';
import 'package:news/settings/view/widgets/settings_tab.dart';

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
        drawer: isSearching
            ? null
            : HomeDrawer(
                onItemSelected: onDrawerItemSelected,
              ),
        body: selectedCategory != null
            ? CategoryDetails(
                selectedCategory!.id,
                query: searchController.text,
              )
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
      title: TextFormField(
        controller: searchController,
        style: const TextStyle(
            color: AppTheme.black, fontSize: 16, fontWeight: FontWeight.w400),
        cursorColor: AppTheme.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.white,
          focusColor: AppTheme.black,
          hintText: "Search Article",
          hintStyle: const TextStyle(
            color: Color(0xff39A552),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: AppTheme.primary,
              size: 32,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.close,
              color: AppTheme.primary,
              size: 28,
            ),
            onPressed: () {
              isSearching = false;
              searchController.clear();
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      title: const Text('News App'),
      actions: selectedCategory != null
          ? [
              IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = true;
                  });
                },
                icon: const Icon(
                  Icons.search,
                  size: 36,
                ),
              )
            ]
          : null,
    );
  }
}
