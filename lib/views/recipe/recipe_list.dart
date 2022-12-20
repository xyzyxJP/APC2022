import 'package:apc2022/api/api.dart';
import 'package:apc2022/models/recipe_list.dart';
import 'package:apc2022/views/recipe/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class RecipeListPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final List<Data> recipeList;

  const RecipeListPage(
      {super.key,
      required this.categoryId,
      required this.categoryName,
      required this.recipeList});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  int _pageIndex = 2;

  final List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  final _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    for (int i = 0; i < widget.recipeList.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: widget.recipeList[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return RecipeCard(recipe: widget.recipeList[index]);
              },
              onStackFinished: () {},
              itemChanged: (SwipeItem item, int index) async {
                if (index == widget.recipeList.length - 2) {
                  List<Data> nextRecipeList = (await API.fetchRecipeList(
                          widget.categoryId, _pageIndex++, 30))
                      .data!;
                  widget.recipeList.addAll(nextRecipeList);
                  for (int i = 0; i < nextRecipeList.length; i++) {
                    _swipeItems.add(
                      SwipeItem(
                        content: nextRecipeList[i],
                      ),
                    );
                  }
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _matchEngine.currentItem?.nope();
                },
                icon: const Icon(Icons.close),
                iconSize: 48.0,
              ),
              IconButton(
                onPressed: () {
                  _matchEngine.currentItem?.superLike();
                },
                icon: const Icon(Icons.star),
                iconSize: 48.0,
              ),
              IconButton(
                onPressed: () {
                  _matchEngine.currentItem?.like();
                },
                icon: const Icon(Icons.favorite),
                iconSize: 48.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
