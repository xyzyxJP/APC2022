import 'package:apc2022/test/test_recipe_list.dart';
import 'package:apc2022/views/recipe/recipe_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APC2022',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:
          // const HomePage(title: 'APC2022 Home Page'),
          RecipeListPage(
        categoryId: "458",
        recipeList: testRecipeList.data!,
      ),
      // const RecipeDetailPage(),
    );
  }
}
