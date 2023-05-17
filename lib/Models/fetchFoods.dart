import 'dart:convert';
import 'package:http/http.dart' as http;
import 'foods.dart';
Future<List<Foods>> fetchFoods()async{
  const url='https://fackfoodapi.onrender.com/foods';
  final response=await http.get(Uri.parse(url));
  if(response.statusCode==200){
    List<dynamic> jsdecode=json.decode(response.body);
    return jsdecode.map((item) {
      return Foods.fromJson(item);
    } ).toList();
  }else{
    throw Exception('there is error');
  }

}