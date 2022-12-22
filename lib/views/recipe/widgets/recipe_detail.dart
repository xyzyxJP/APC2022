import 'package:apc2022/models/recipe_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  style: GoogleFonts.yuseiMagic(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Align(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 90, 90, 90)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CachedNetworkImage(
                      imageUrl: recipe.squareVideo!.posterUrl!,
                      errorWidget: (context, url, dynamic error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                _buildCalYenTime(recipe),
              ],
            )),
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
            //作り方
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipe.recipeSteps!.length,
                itemBuilder: (context, index) {
                  return _buildRecipeSteps(recipe.recipeSteps![index]);
                },
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

  Container _buildCalYenTime(Data recipe) {
    return Container(
      height: 200,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(43, 5, 54, 83),
        ),
        color: Color.fromARGB(15, 143, 201, 240),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.whatshot),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              recipe.nutrient!.items!.first.amount!,
              style: GoogleFonts.yuseiMagic(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5.0)),
          const Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.currency_yen),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              recipe.cookingCost!.substring(5),
              style: GoogleFonts.yuseiMagic(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5.0)),
          const Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.timer),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              recipe.cookingTime!.substring(5),
              style: GoogleFonts.yuseiMagic(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientGroup(IngredientGroups? ingredientGroups) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color.fromARGB(59, 0, 0, 0),
                ),
                color: Color.fromARGB(15, 143, 201, 240),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  ingredientGroups!.name ?? '材料',
                  style: GoogleFonts.yuseiMagic(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
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
                    Text(ingredientGroups.recipeIngredients![index].name!,
                        style: GoogleFonts.yuseiMagic(
                          fontSize: 18,
                        )),
                    Text(ingredientGroups.recipeIngredients![index].servings1!,
                        style: GoogleFonts.yuseiMagic(
                          fontSize: 18,
                        )),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeSteps(RecipeSteps? recipeSteps) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: Color.fromARGB(90, 11, 0, 172)),
                        color: Color.fromARGB(19, 143, 201, 240),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'step',
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            recipeSteps!.step!.toString(),
                            style: GoogleFonts.yuseiMagic(
                              fontSize: 19,
                            ),
                          ),
                        ],
                      )),
                  Text(
                    recipeSteps!.description!,
                    style: GoogleFonts.yuseiMagic(
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
