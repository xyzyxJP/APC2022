import 'package:apc2022/models/recipe_detail.dart';
import 'package:apc2022/models/recipe_list.dart';

class API {
  static const String baseUrl = "https://delishkitchen.tv/api/";

  // TODO: category_id, page, per を引数に recipe_list を返すメソッド
  static Future<RecipeList> fetchRecipeList(
      String categoryId, int page, int per) async {
    var recipeList = RecipeList();

    return recipeList;
  }

  // TODO: recipe_id を引数に recipe を返すメソッド
  static Future<RecipeDetail> fetchRecipeDetail(String recipeId) async {
    var recipeDetail = RecipeDetail();

    return recipeDetail;
  }
}
