import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_portfolio/src/features/features.dart';
import 'package:mobile_portfolio/src/settings/settings_view.dart';
// import 'package:mobile_portfolio/src/settings/settings_view.dart';

class Routes {
  static const home = '/';
  static const settings = '/';
  static const riverpodSamples = '/samples/riverpod';
}

Route onGenerateRoutes(RouteSettings routeSettings) {
  return CupertinoPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeSettings.name) {
        case Routes.riverpodSamples:
          return const RiverpodSamples();
        case Routes.settings:
          return const SettingsView();
        default:
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.riverpodSamples,
                  );
                },
                child: const Text('Failed'),
              ),
            ),
          );
      }
    },
  );
}
