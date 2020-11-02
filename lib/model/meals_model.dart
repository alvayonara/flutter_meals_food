import 'dart:convert';
import 'package:http/http.dart' as http;

class Meals {
  String id;
  String meal;
  String thumb;
  String category;
  String area;
  String tags;
  String instructions;

  Meals(
      {this.id,
      this.meal,
      this.thumb,
      this.category,
      this.area,
      this.tags,
      this.instructions});

  factory Meals.getMeals(Map<String, dynamic> object) {
    return Meals(
        id: object['idMeal'],
        meal: object['strMeal'],
        thumb: object['strMealThumb'],
        category: object['strCategory'],
        area: object['strArea'],
        tags: object['strTags'],
        instructions: object['strInstructions']);
  }

  static Future<List<Meals>> getBreakfast() async {
    String apiURL =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listBreakfast = (jsonObject as Map<String, dynamic>)['meals'];

    List<Meals> breakfasts = [];
    for (int i = 0; i < listBreakfast.length; i++) {
      breakfasts.add(Meals.getMeals(listBreakfast[i]));
    }

    return breakfasts;
  }

  static Future<Meals> getDetail(String id) async {
    String apiURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    return Meals.getMeals(jsonObject['meals'][0]);
  }
}
