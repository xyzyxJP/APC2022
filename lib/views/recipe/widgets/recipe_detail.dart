import 'package:apc2022/models/recipe_detail.dart';
import 'package:flutter/material.dart';

class RecipeDetailModal extends StatelessWidget {
  final ScrollController scrollController;
  final Data recipe;
  const RecipeDetailModal(
      {super.key, required this.recipe, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: ListView(
          controller: scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(recipe.title!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipe.description!,
                style: TextStyle(fontSize: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
