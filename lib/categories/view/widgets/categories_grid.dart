import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/categories/data/models/category_model.dart';

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
        id: 'technology',
        name: 'Technology',
        imageName: 'tech',
        color: AppTheme.darkBlue,
      ),
      CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: 'business',
        name: 'Bussines',
        imageName: 'bussines',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        imageName: 'entertainment',
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
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
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
