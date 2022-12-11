import 'package:flutter/material.dart';

import 'package:android_tv_test_app/page/loader.dart';
import 'package:android_tv_test_app/theme/app_theme.dart';

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android TV Test App',
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const LoaderPage(),
      },
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}
