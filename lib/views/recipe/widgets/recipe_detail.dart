import 'package:apc2022/models/recipe_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
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
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        controller: widget.scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                recipe.title!,
                style: GoogleFonts.yuseiMagic(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: recipe.squareVideo!.posterUrl!,
                  errorWidget: (context, url, dynamic error) =>
                      const Icon(Icons.error),
                ),
              ),
              _buildNutrients(recipe),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 8.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipe.ingredientGroups!.length,
            itemBuilder: (context, index) {
              return _buildIngredientGroup(recipe.ingredientGroups![index]);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 4.0,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
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
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 4.0,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipe.recipeSteps!.length,
            itemBuilder: (context, index) {
              return _buildRecipeStep(recipe.recipeSteps![index]);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 4.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                launchUrl(
                    Uri.parse('https://delishkitchen.tv/recipes/${recipe.id}'),
                    mode: LaunchMode.externalApplication);
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Share.share(
                  '${recipe.title!}\nhttps://delishkitchen.tv/recipes/${recipe.id}',
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.share),
                    SizedBox(width: 8.0),
                    Text(
                      'リンクを共有',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildNutrients(Data recipe) {
    return Container(
      height: 200,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).focusColor,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Icon(Icons.whatshot),
              Text(
                recipe.nutrient!.items!.first.amount!,
                style: GoogleFonts.yuseiMagic(fontSize: 16.0),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.currency_yen),
              Text(
                recipe.cookingCost!.split(' ')[1],
                style: GoogleFonts.yuseiMagic(fontSize: 16.0),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.timer),
              Text(
                recipe.cookingTime!.split(' ')[1],
                style: GoogleFonts.yuseiMagic(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientGroup(IngredientGroups? ingredientGroups) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).highlightColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                ingredientGroups!.name ?? '材料',
                style: GoogleFonts.yuseiMagic(fontSize: 18.0),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ingredientGroups.recipeIngredients!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ingredientGroups.recipeIngredients![index].name!,
                        style: GoogleFonts.yuseiMagic(fontSize: 18.0)),
                    Text(ingredientGroups.recipeIngredients![index].servings1!,
                        style: GoogleFonts.yuseiMagic(fontSize: 18.0)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeStep(RecipeSteps? recipeSteps) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).highlightColor,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Step',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      recipeSteps!.step!.toString(),
                      style: GoogleFonts.yuseiMagic(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                recipeSteps.description!,
                style: GoogleFonts.yuseiMagic(fontSize: 18.0),
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
