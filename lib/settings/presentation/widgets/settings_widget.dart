import 'package:flutter/material.dart';
import 'package:ricka_and_morty/shared/extensions/settings_extensions.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 32.0,
            ),
            ListTile(
              title: Text(
                'External Links',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(),
            ),
            ListTile(
              title: const Text('Flutter dev'),
              leading: const Icon(
                Icons.flutter_dash_outlined,
                color: Colors.blueAccent,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => 'flutter.dev'.launchInBrowser(),
            ),
            ListTile(
              title: const Text('Android developers blog'),
              leading: const Icon(
                Icons.android,
                color: Colors.greenAccent,
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () =>
                  'android-developers.googleblog.com'.launchInBrowser(),
            )
          ],
        ),
      ],
    );
  }
}
