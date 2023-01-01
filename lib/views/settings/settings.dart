import 'package:apc2022/provider/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> ingredientList =
        Provider.of<SettingsProvider>(context, listen: false).ingredientList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CheckboxListTile(
            title: const Text('ダークモードを有効にする'),
            value: Provider.of<SettingsProvider>(context, listen: false)
                .isDarkMode,
            onChanged: (bool? value) {
              setState(() {
                Provider.of<SettingsProvider>(context, listen: false)
                    .setDarkMode(value!);
              });
            },
            controlAffinity: ListTileControlAffinity.platform,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 4.0,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.scale_rounded),
            title: Text('調味料'),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ingredientList.length, // この行を追加
            itemBuilder: (BuildContext context, int index) => CheckboxListTile(
              title: Text(ingredientList.keys.toList()[index]),
              value: ingredientList.values.toList()[index],
              onChanged: (bool? value) {
                setState(() {
                  Provider.of<SettingsProvider>(context, listen: false)
                      .setIngredientList(
                          ingredientList.keys.toList()[index], value!);
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 4.0,
            ),
          ),
          ListTile(
            onTap: (() => showLicensePage(context: context)),
            leading: const Icon(Icons.info_rounded),
            title: const Text('ライセンス情報'),
          ),
        ],
      ),
    );
  }
}
