import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/screens/home_screens.dart';
import 'providers/recipe_provider.dart';
import 'screens/add_edit_recipe_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddEditRecipeScreen(),
    );
  }
}



