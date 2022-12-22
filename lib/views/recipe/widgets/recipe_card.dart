import 'package:apc2022/models/recipe.dart';
import 'package:apc2022/views/recipe/widgets/photo_view.dart';
import 'package:apc2022/views/recipe/widgets/recipe_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

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
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Material(
            child: Stack(
              fit: StackFit.expand,
              children: [
                PhotoView(
                  photoPaths: [
                        recipe.outline.squareVideo!.posterUrl!,
                      ] +
                      recipe.content.recipeSteps!
                          .map((e) => e.squareVideo!.posterUrl!)
                          .toList(),
                ),
                _buildProfile(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    for (var i = 1; i < recipe.content.recipeSteps!.length; i++) {
      precacheImage(
          CachedNetworkImageProvider(
              recipe.content.recipeSteps![i].squareVideo!.posterUrl!),
          context);
    }
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: GestureDetector(
        onTap: () async {
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.0))),
            builder: (context) => DraggableScrollableSheet(
              maxChildSize: (MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.top +
                          AppBar().preferredSize.height)) /
                  MediaQuery.of(context).size.height,
              expand: false,
              builder: (context, scrollController) => RecipeDetailModal(
                  recipe: recipeDetail.data!,
                  scrollController: scrollController),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      recipe.outline.title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: recipe.report.rateAverage ?? 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemSize: 24.0,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Text(
                          '${recipe.report.rateAverage} (${recipe.report.totalReportCount}件)',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.whatshot,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            Text(
                              recipe.outline.calorie!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(width: 18.0),
                            const Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            Text(
                              recipe.outline.cookingTime!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
