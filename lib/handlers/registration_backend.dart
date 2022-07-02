import 'dart:convert';
import 'package:bee/modals/registration.dart';
import 'package:http/http.dart' as http;

Future<Registration> addRegistration(Registration registration) async{
  final response =
  await http.post(Uri.parse('http://10.0.2.2:3000/registration'),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },

    body: jsonEncode(<String, String>{
      'weight':registration.weight
    }),
  );
  print("wselt HOUNi");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Registration.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load offers');
  }

}
