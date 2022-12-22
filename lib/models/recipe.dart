import 'package:apc2022/api/api.dart';
import 'package:apc2022/models/cooking_report.dart' as cooking_report;
import 'package:apc2022/models/recipe_detail.dart' as recipe_detail;
import 'package:apc2022/models/recipe_list.dart' as recipe_list;

class Recipe {
  String get id => outline.id ?? "";
  recipe_list.Data outline;
  recipe_detail.Data content;
  cooking_report.Data report;

  Recipe({
    required this.outline,
    required this.content,
    required this.report,
  });

  Recipe.init(recipe_list.Data outline)
      : this(
          outline: outline,
          content: recipe_detail.Data(),
          report: cooking_report.Data(),
        );

  Future<void> fetchBody() async {
    content = (await API.fetchRecipeDetail(id)).data!;
    report = (await API.fetchCookingReport(id, 10)).data!;
  }
}
