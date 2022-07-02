import 'dart:convert';
import 'package:bee/modals/information.dart';
import 'package:http/http.dart' as http;
Future<Information> getInformation() async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/recommendation'),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Information.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load recommendations');
  }

}


