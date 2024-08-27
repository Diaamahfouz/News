import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/category_item.dart';
import 'package:news/category/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});
  final Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    const List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'ball',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: 'Politics',
        name: 'Politics',
        imageName: 'Politics',
        color: AppTheme.darkBlue,
      ),
      CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: 'bussines',
        name: 'Bussines',
        imageName: 'bussines',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: 'environment',
        name: 'Environment',
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      CategoryModel(
        id: 'science',
        name: 'Science',
        imageName: 'science',
        color: AppTheme.yellow,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            child: Text(
              'Pick Your Category                of interest !',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.navy,
                    fontSize: 25,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                ),
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      onCategorySelected(category);
                    },
                    child: CategoryItem(
                      category: category,
                      index: index,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
