import 'dart:convert';
import 'package:http/http.dart' as http;
import 'RadioResponse.dart';


Future<RadioResponse> getRadioStations(String api)async{

  final uri = Uri.parse(api);
  final response = await http.get(uri);
  if(response.statusCode == 200)
  {
    return RadioResponse.fromJsonMap(jsonDecode(response.body));
  }
  else
  {
    throw Exception("Failed to load data");
  }
}