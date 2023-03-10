import 'dart:convert';
import 'package:flutter_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

 static Future<List<Recipe>> getRecipe() async{
  var uri  = Uri.https('yummly2.p.rapidapi.com','/feeds/list',
  {"limit": "24",
	"start": "0", "tag": "list.recipe.popular"});

  final response = await http.get(uri, headers:{
    "x-rapidapi-Key": "155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32",
	"x-rapidapi-Host": "yummly2.p.rapidapi.com",
	"useQueryString": "true"});
Map data = jsonDecode(response.body);
List _temp=[];
for(var i in data['feed']){
  _temp.add(i['content']['details']);

}
return Recipe.recipesFromSnapshot(_temp);
}
}