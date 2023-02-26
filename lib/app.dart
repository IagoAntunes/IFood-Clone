import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_theme.dart';
import 'package:ifood/views/content/content_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFood',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const ContentPage(),
    );
  }
}
