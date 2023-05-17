import 'dart:convert';
import 'package:restaurant/Models/categories.dart';
import 'package:http/http.dart' as http;
Future<List<Categories>> fetchCategories()async{
  const url='https://fackfoodapi.onrender.com/categories';
  final response=await http.get(Uri.parse(url));
  if(response.statusCode==200){
    List<dynamic> jsondecode=json.decode(response.body);
    return jsondecode.map((item) {
      return Categories.fromJson(item);
    } ).toList();
  }else{
    throw Exception('there is error');
  }

}