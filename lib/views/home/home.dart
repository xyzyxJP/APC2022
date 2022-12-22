import 'package:apc2022/api/api.dart';
import 'package:apc2022/models/recipe_detail.dart' as detail;
import 'package:apc2022/models/recipe_list.dart' as list;
import 'package:apc2022/views/recipe/recipe_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildCategoryButton("458", "豚肉")],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String categoryId, String categoryName) =>
      ElevatedButton(
          onPressed: (() async => _onPressed(categoryId, categoryName)),
          child: Text(categoryName));

  void _onPressed(String categoryId, String categoryName) async {
    final Map<list.Data, detail.Data> recipeList = {};
    recipeList.addAll(
        (await API.fetchRecipeList(categoryId, 1, 30)).data!.asMap().map(
              (key, value) => MapEntry(
                value,
                detail.Data(),
              ),
            ));
    for (var i = 0; i < 3; i++) {
      final detail.Data recipeDetail =
          (await API.fetchRecipeDetail(recipeList.keys.elementAt(i).id!)).data!;
      recipeList.update(recipeList.keys.elementAt(i), (value) => recipeDetail);
    }
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeListPage(
          categoryId: categoryId,
          categoryName: categoryName,
          recipeList: recipeList,
        ),
      ),
    );
  }
}
