import 'package:apc2022/models/recipe_list.dart';
import 'package:apc2022/test/test_recipe_list.dart';
import 'package:apc2022/views/recipe/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final RecipeList _recipeList = testRecipeList;

  List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  final _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _recipeList.data!.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: _recipeList.data![i],
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {},
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          },
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Swipe Cards"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 550,
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  return RecipeCard(recipe: _recipeList.data![index]);
                },
                onStackFinished: () {},
                itemChanged: (SwipeItem item, int index) {
                  print("item: ${item.content}, index: $index");
                },
                upSwipeAllowed: true,
                fillSpace: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
