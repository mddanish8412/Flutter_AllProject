import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/recipe.dart';



class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  RecipeProvider() {
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    final data = await DatabaseHelper.instance.queryAllRecipes();
    _recipes = data;
    notifyListeners();
  }

  Future<void> addRecipe(Recipe recipe) async {
    await DatabaseHelper.instance.insertRecipe(recipe);
    _loadRecipes();
  }

  Future<void> updateRecipe(Recipe recipe) async {
    await DatabaseHelper.instance.updateRecipe(recipe);
    _loadRecipes();
  }

  Future<void> deleteRecipe(int id) async {
    await DatabaseHelper.instance.deleteRecipe(id);
    _loadRecipes();
  }
}
