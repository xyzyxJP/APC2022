import 'package:apc2022/models/recipe_list.dart';
import 'package:apc2022/views/recipe/widgets/photo_view.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Data recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 2.0,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Material(
            child: Stack(
              fit: StackFit.expand,
              children: recipe.id != null
                  ? <Widget>[
                      PhotoView(
                        photoPaths: [
                          recipe.squareVideo!.posterUrl!,
                          recipe.squareVideo!.posterUrl!
                        ],
                      ),
                      _buildProfile(),
                    ]
                  : <Widget>[],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ])),
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(recipe.title!,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 24.0)),
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(recipe.cookingTime!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18.0)),
                      const SizedBox(width: 10.0),
                      const Icon(
                        IconData(0xea8c, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(recipe.calorie!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18.0)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
