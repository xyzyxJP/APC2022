import 'dart:convert';

import 'package:apc2022/models/recipe_detail.dart';
import 'package:apc2022/models/recipe_list.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<RecipeList> fetchRecipeList(String categoryId, int page, int per) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://delishkitchen.tv/api/categories/$categoryId/recipes?page=$page&per=$per'));
    http.StreamedResponse response = await request.send();
    return RecipeList.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  static Future<RecipeDetail> fetchRecipeDetail(String recipeId) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://delishkitchen.tv/api/recipes/$recipeId?include_maintenance=true'));
    http.StreamedResponse response = await request.send();
    return RecipeDetail.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }
}
