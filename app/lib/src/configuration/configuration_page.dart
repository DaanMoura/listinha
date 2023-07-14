import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    context.select(() => appStore.themeMode);

    void _changeThemeMode(ThemeMode? mode) {
      if (mode != null) {
        appStore.themeMode = mode;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text('Tema', style: textTheme.titleMedium),
            const SizedBox(height: 10),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: appStore.themeMode,
              title: const Text('Sistema'),
              onChanged: _changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: appStore.themeMode,
              title: const Text('Claro'),
              onChanged: _changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode,
              title: const Text('Escuro'),
              onChanged: _changeThemeMode,
            ),
            const SizedBox(height: 20),
            Text('Controle de dados', style: textTheme.titleMedium),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Apagar cache e reiniciar o app',
              ),
            )
          ],
        ),
      ),
    );
  }
}
