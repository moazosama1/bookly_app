import 'package:bookly_app/core/theme/theme.dart';
import 'package:bookly_app/features/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeOfApp.basicTheme,
      home:const SplashView(),
    );
  }
}
