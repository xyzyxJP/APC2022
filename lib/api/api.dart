import 'dart:convert';

import 'package:apc2022/models/recipe_detail.dart';
import 'package:apc2022/models/recipe_list.dart';
import 'package:http/http.dart' as http;

class API {
  static const String baseUrl = "https://delishkitchen.tv/api/";

  static Future<RecipeList> fetchRecipeList(
      String categoryId, int page, int per) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://delishkitchen.tv/api/categories/$categoryId/recipes?page=$page&per=$per'));
    http.StreamedResponse response = await request.send();
    return RecipeList.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  // TODO: recipe_id を引数に recipe を返すメソッド
  static Future<RecipeDetail> fetchRecipeDetail(String recipeId) async {
    var recipeDetail = RecipeDetail();

    return recipeDetail;
  }
}
