import 'package:flutter/material.dart';
import 'package:flutter_recipe/models/recipe.dart';
import 'package:flutter_recipe/models/recipe.api.dart';
import 'package:flutter_recipe/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Row(
              mainAxisAlignment:MainAxisAlignment.center,children: [
              Icon(Icons.restaurant_menu, color: Colors.black),
              SizedBox(width: 10),
              Text("Food Recipe",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15))
            ])),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images,
                  );
                }));
  }
}
