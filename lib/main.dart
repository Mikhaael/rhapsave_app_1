import 'package:flutter/material.dart';

import 'presentation/core/routes.dart';
import 'presentation/core/strings.dart';
import 'presentation/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: theme,
      routes: Routes.routes,
    );
  }
}
