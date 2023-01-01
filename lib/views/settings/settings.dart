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
