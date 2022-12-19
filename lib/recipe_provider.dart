import 'package:apc2022/api/api.dart';
import 'package:apc2022/models/recipe_detail.dart' as detail;
import 'package:apc2022/models/recipe_list.dart' as list;
import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  var _categoryId = "1";

  var _pageIndex = 1;
  var _itemIndex = 0;
  var _recipeListStack = <list.RecipeList>[];

  void setCategoryId(String categoryId) {
    _categoryId = categoryId;
    reset();
  }

  void reset() {
    _recipeListStack = <list.RecipeList>[];
    _pageIndex = 1;
    _itemIndex = 0;
  }

  list.Data? get currentRecipe {
    if (_recipeListStack.length < _pageIndex) {
      return null;
    }

    if (_recipeListStack[_pageIndex].data!.length < _itemIndex) {
      return null;
    }

    return _recipeListStack[_pageIndex].data![_itemIndex];
  }

  Future<list.Data?> getNextRecipe() async {
    if (_recipeListStack[_pageIndex].data!.length < _itemIndex) {
      _itemIndex = 0;
      _pageIndex++;
    }

    if (_recipeListStack.length < _pageIndex) {
      return null;
    }

    if (_recipeListStack[_pageIndex].data!.length < _itemIndex) {
      _recipeListStack
          .add(await API.fetchRecipeList(_categoryId, _pageIndex++, 30));
      if (_recipeListStack[_pageIndex].data!.length < _itemIndex) {
        return null;
      }
    }

    return _recipeListStack[_pageIndex].data![_itemIndex++];
  }

  Future<detail.RecipeDetail> getRecipeDetail() async {
    return await API.fetchRecipeDetail(currentRecipe!.id!);
  }
}
