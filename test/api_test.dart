import 'package:apc2022/api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('API fetch recipe list test', () async {
    var recipeList = await API.fetchRecipeList("458", 2, 30);
    expect(recipeList.data!.length, 30);
    if (kDebugMode) {
      print(recipeList.data![0].title);
    }
  });
  test('API fetch recipe detail test', () async {
    var recipeDetail = await API.fetchRecipeDetail("220499003148599645");
    expect(recipeDetail.data!.id, "220499003148599645");
    if (kDebugMode) {
      print(recipeDetail.data!.title);
    }
  });
}