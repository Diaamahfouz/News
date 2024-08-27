import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});

  final void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    final titleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            height: screenSize.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: titleLargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(top: 12, start: 12),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.list,
                          size: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Categories',
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings_outlined,
                          size: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Settings',
                          style:
                              titleLargeStyle?.copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings;
}
