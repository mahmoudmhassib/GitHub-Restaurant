import 'dart:convert';
import 'package:http/http.dart' as http;
import 'foods.dart';
Future<Foods> fetchMeal(int id)async{
  final url='https://fackfoodapi.onrender.com/foods/$id';
  final response=await http.get(Uri.parse(url));
  if(response.statusCode==200){
    Map<String,dynamic> jsdecode=json.decode(response.body);
    return Foods.fromJson(jsdecode);
  }else{
    throw Exception('there is error');
  }

}