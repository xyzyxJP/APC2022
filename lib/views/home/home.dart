import 'package:apc2022/api/api.dart';
import 'package:apc2022/models/recipe.dart';
import 'package:apc2022/views/settings/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, Object>> categoryList_meat = [
    {"id": "458", "name": "豚肉", "icon": Icons.kebab_dining},
    {"id": "430", "name": "鶏肉", "icon": Icons.kebab_dining},
    {"id": "821", "name": "牛肉", "icon": Icons.kebab_dining},
    {"id": "9479", "name": "ひき肉", "icon": Icons.kebab_dining},
  ];
  final List<Map<String, Object>> categoryList_vegi = [
    {"id": "2824", "name": "なす", "icon": Icons.grass},
    {"id": "2700", "name": "もやし", "icon": Icons.grass},
    {"id": "2697", "name": "にんじん", "icon": Icons.grass},
    {"id": "2736", "name": "玉ねぎ", "icon": Icons.grass},
    {"id": "1177", "name": "じゃが芋", "icon": Icons.grass},
    {"id": "2699", "name": "キャベツ", "icon": Icons.grass},
    {"id": "2915", "name": "きゅうり", "icon": Icons.grass},
    {"id": "2749", "name": "トマト", "icon": Icons.grass},
    {"id": "2728", "name": "ピーマン", "icon": Icons.grass},
  ];
  final List<Map<String, Object>> categoryList_fish = [
    {"id": "2706", "name": "サケ", "icon": Icons.set_meal},
    {"id": "16909", "name": "サバ", "icon": Icons.set_meal},
    {"id": "16911", "name": "サンマ", "icon": Icons.set_meal},
    {"id": "7195", "name": "イワシ", "icon": Icons.set_meal},
    {"id": "16910", "name": "ブリ", "icon": Icons.set_meal},
    {"id": "17243", "name": "マグロ", "icon": Icons.set_meal},
    {"id": "5779", "name": "えび", "icon": Icons.set_meal},
    {"id": "4589", "name": "アジ", "icon": Icons.set_meal},
    {"id": "2855", "name": "イカ", "icon": Icons.set_meal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ExpansionTile(
            title: const Text("肉類から選ぶ"),
            children: <Widget>[
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: categoryList_meat.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryButton(
                        categoryList_meat[index]["id"] as String,
                        categoryList_meat[index]["name"] as String,
                        categoryList_meat[index]["icon"] as IconData);
                  },
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("野菜から選ぶ"),
            children: <Widget>[
              Container(
                color: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: categoryList_vegi.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryButton(
                        categoryList_vegi[index]["id"] as String,
                        categoryList_vegi[index]["name"] as String,
                        categoryList_vegi[index]["icon"] as IconData);
                  },
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("魚類から選ぶ"),
            children: <Widget>[
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: categoryList_fish.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryButton(
                        categoryList_fish[index]["id"] as String,
                        categoryList_fish[index]["name"] as String,
                        categoryList_fish[index]["icon"] as IconData);
                  },
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(
          String categoryId, String categoryName, IconData categoryIcon) =>
      ElevatedButton(
          onPressed: (() async => _onPressed(categoryId, categoryName)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categoryIcon),
              const SizedBox(height: 8.0),
              Text(
                categoryName,
                style: const TextStyle(fontSize: 19.0, color: Colors.black),
              ),
            ],
          ));

  void _onPressed(String categoryId, String categoryName) async {
    final List<Recipe> recipeList = [];
    recipeList.addAll((await API.fetchRecipeList(categoryId, 1, 30)).data!.map(
          (e) => Recipe.init(e),
        ));
    for (var i = 0; i < 3; i++) {
      await recipeList[i].fetchBody();
    }
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(
          categoryId: categoryId,
          categoryName: categoryName,
          recipeList: recipeList,
        ),
      ),
    );
  }
}
