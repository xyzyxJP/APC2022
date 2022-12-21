import 'package:apc2022/models/recipe_detail.dart';
import 'package:flutter/material.dart';

class RecipeDetailModal extends StatelessWidget {
  final Data recipe;

  const RecipeDetailModal({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(recipe.title!),
        ],
      ),
    );
  }
}
