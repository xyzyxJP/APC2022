import 'package:apc2022/api/api.dart';
import 'package:apc2022/models/category.dart';
import 'package:apc2022/models/recipe.dart';
import 'package:apc2022/views/recipe/recipe_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryMap> categoryMapList = [
    CategoryMap(
      name: '肉類',
      color: Colors.red,
      list: [
        Category(id: '458', name: '豚肉', icon: Icons.kebab_dining),
        Category(id: '430', name: '鶏肉', icon: Icons.kebab_dining),
        Category(id: '821', name: '牛肉', icon: Icons.kebab_dining),
        Category(id: '9479', name: 'ひき肉', icon: Icons.kebab_dining),
      ],
    ),
    CategoryMap(
      name: '野菜',
      color: Colors.green,
      list: [
        Category(id: '2824', name: 'なす', icon: Icons.grass),
        Category(id: '2700', name: 'もやし', icon: Icons.grass),
        Category(id: '2697', name: 'にんじん', icon: Icons.grass),
        Category(id: '2736', name: '玉ねぎ', icon: Icons.grass),
        Category(id: '1177', name: 'じゃが芋', icon: Icons.grass),
        Category(id: '2699', name: 'キャベツ', icon: Icons.grass),
        Category(id: '2915', name: 'きゅうり', icon: Icons.grass),
        Category(id: '2749', name: 'トマト', icon: Icons.grass),
        Category(id: '2728', name: 'ピーマン', icon: Icons.grass),
      ],
    ),
    CategoryMap(
      name: '魚類',
      color: Colors.blue,
      list: [
        Category(id: '2706', name: 'サケ', icon: Icons.set_meal),
        Category(id: '16909', name: 'サバ', icon: Icons.set_meal),
        Category(id: '16911', name: 'サンマ', icon: Icons.set_meal),
        Category(id: '7195', name: 'イワシ', icon: Icons.set_meal),
        Category(id: '16910', name: 'ブリ', icon: Icons.set_meal),
        Category(id: '17243', name: 'マグロ', icon: Icons.set_meal),
        Category(id: '5779', name: 'えび', icon: Icons.set_meal),
        Category(id: '4589', name: 'アジ', icon: Icons.set_meal),
        Category(id: '2855', name: 'イカ', icon: Icons.set_meal),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        controller: scrollController,
        child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: categoryMapList.length,
            itemBuilder: (context, index) =>
                _buildCategoryTile(categoryMapList[index])),
      ),
    );
  }

  Widget _buildCategoryTile(CategoryMap categoryMap) {
    return ExpansionTile(
      initiallyExpanded: true,
      collapsedTextColor: categoryMap.color,
      textColor: categoryMap.color,
      title: Text('${categoryMap.name}から選ぶ'),
      children: [
        Container(
          color: categoryMap.color.withOpacity(0.1),
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: categoryMap.list.length,
            itemBuilder: (context, index) => _buildCategoryButton(
                categoryMap.color, categoryMap.list[index]),
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButton(Color color, Category category) => ElevatedButton(
        onPressed: (() async => _onPressed(category.id, category.name)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: color,
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: Text(
                category.name,
                style: TextStyle(
                  fontSize: 16.0,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      );

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
        builder: (context) => RecipeListPage(
          categoryId: categoryId,
          categoryName: categoryName,
          recipeList: recipeList,
        ),
      ),
    );
  }
}
