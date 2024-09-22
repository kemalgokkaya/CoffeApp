import 'package:coffe_app/coffe_app.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      builder: (context, child) {
        return GestureDetector(
          child: child,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        );
      },
    );
  }
}
