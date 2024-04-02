import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zinc_product_demo/repository/product_repository.dart';
import 'package:zinc_product_demo/service/product_service.dart';
import 'package:zinc_product_demo/views/home_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => ProductRepository());
  getIt.registerLazySingleton(() => ProductService());
}
