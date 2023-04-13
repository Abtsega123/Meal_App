import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_apk/data/dummy_data.dart';
import 'package:meal_apk/main.dart';
import 'package:meal_apk/models/meal.dart';
import 'package:meal_apk/widgets/category_grid_item.dart';
import 'package:meal_apk/screens/meals.dart';
import 'package:meal_apk/models/category.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({
    super.key,
  required this.onToggleFavorite,});

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals= dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
        onToggleFavorite: onToggleFavorite,
    ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(14),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 3 /2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        ),

        children: [
         for( final category in availableCategories)
           CategoryGridItem(category: category, onSelectCategory:  () {
             _selectCategory(context, category);
           },)
        ],

    );
  }
}