import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:apc2022/models/recipe.dart';

class SettingsPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final List<Recipe> recipeList;

  const SettingsPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.recipeList,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
    );
  }
}
