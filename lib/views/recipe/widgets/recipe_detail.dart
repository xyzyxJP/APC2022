import 'package:apc2022/models/recipe_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class RecipeDetailModal extends StatefulWidget {
  final ScrollController scrollController;
  final Data recipe;

  const RecipeDetailModal(
      {super.key, required this.scrollController, required this.recipe});

  @override
  State<RecipeDetailModal> createState() => _RecipeDetailModalState();
}

class _RecipeDetailModalState extends State<RecipeDetailModal> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.recipe.squareVideo!.url!)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: ListView(
          controller: widget.scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  recipe.title!,
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipe.ingredientGroups!.length,
                itemBuilder: (context, index) {
                  return _buildIngredientGroup(recipe.ingredientGroups![index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: CachedNetworkImage(
                imageUrl: recipe.squareVideo!.posterUrl!,
                errorWidget: (context, url, dynamic error) =>
                    const Icon(Icons.error),
              ),
            ),
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchUrl(
                  Uri.parse("https://delishkitchen.tv/recipes/${recipe.id}"),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.open_in_browser),
                    SizedBox(width: 8.0),
                    Text(
                      'ブラウザで開く',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientGroup(IngredientGroups? ingredientGroups) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            ingredientGroups!.name ?? '名前なし',
            style: const TextStyle(fontSize: 16.0),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ingredientGroups.recipeIngredients!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ingredientGroups.recipeIngredients![index].name!),
                    Text(ingredientGroups.recipeIngredients![index].servings1!)
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
