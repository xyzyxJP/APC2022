import 'package:apc2022/api/api.dart';
import 'package:apc2022/models/recipe.dart';
import 'package:apc2022/views/recipe/widgets/recipe_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class RecipeListPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final List<Recipe> recipeList;

  const RecipeListPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.recipeList,
  });

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  int _pageIndex = 2;

  final List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  final _scaffoldKey = GlobalKey();

  final List<Recipe> _favoriteList = [];

  @override
  void initState() {
    super.initState();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    for (int i = 0; i < widget.recipeList.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: widget.recipeList[i],
          likeAction: () {
            setState(() {
              _favoriteList.add(widget.recipeList[i]);
            });
          },
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
          _buildSwipeCards(),
          _buildActionButtons(),
          _buildFavoriteBar()
        ],
      ),
    );
  }

  Widget _buildFavoriteBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.0))),
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return _buildFavoriteList(setState);
                },
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${_favoriteList.length}件のお気に入り',
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteList(void Function(void Function()) setState) {
    return DraggableScrollableSheet(
      maxChildSize: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top) /
          MediaQuery.of(context).size.height,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${_favoriteList.length}件のお気に入り',
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _favoriteList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildRecipeRow(index, setState);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecipeRow(
      int index, void Function(void Function()) modalSetState) {
    return Dismissible(
      key: Key(_favoriteList[index].id!),
      background: Container(
        padding: const EdgeInsets.only(
          right: 24.0,
        ),
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        _favoriteList.removeAt(index);
        modalSetState(() {});
        setState(() {});
      },
      direction: DismissDirection.endToStart,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 80.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl:
                      _favoriteList[index].outline.squareVideo!.posterUrl!,
                  errorWidget: (context, url, dynamic error) =>
                      const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _favoriteList[index].outline.title!,
                      style: const TextStyle(fontSize: 20.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.whatshot,
                          size: 20.0,
                        ),
                        Text(
                          _favoriteList[index].outline.calorie!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(width: 18.0),
                        const Icon(
                          Icons.timer,
                          size: 20.0,
                        ),
                        Text(
                          _favoriteList[index].outline.cookingTime!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
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

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              _matchEngine.currentItem?.nope();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.close_rounded,
                color: Colors.blue,
                size: 40.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _matchEngine.currentItem?.like();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeCards() {
    return SizedBox(
      height: 600,
      child: SwipeCards(
        matchEngine: _matchEngine,
        itemBuilder: (BuildContext context, int index) {
          if (index + 1 < widget.recipeList.length) {
            precacheImage(
                CachedNetworkImageProvider(
                    widget.recipeList[index].outline.squareVideo!.posterUrl!),
                context);
          }
          return RecipeCard(recipe: widget.recipeList[index]);
        },
        onStackFinished: () {},
        itemChanged: (SwipeItem item, int index) async {
          if (index == widget.recipeList.length - 2) {
            API.fetchRecipeList(widget.categoryId, _pageIndex++, 30).then(
              (value) {
                final List<Recipe> nextRecipeList =
                    value.data!.map((e) => Recipe.init(e)).toList();
                widget.recipeList.addAll(nextRecipeList);
                _swipeItems
                    .addAll(nextRecipeList.map((e) => SwipeItem(content: e)));
              },
            );
          }
          widget.recipeList[index + 2].fetchBody();
        },
      ),
    );
  }
}
