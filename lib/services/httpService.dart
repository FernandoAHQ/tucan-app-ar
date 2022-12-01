import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../config/constants.dart';

import '../models/location.dart';

class HTTPService {
  final String urlBase = Constant.baseUrl + 'api';

  Future<Response> getTime() async {
    return await http.get(Uri.parse('$urlBase/date/today'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
  }
  
  Future<Response> getCategories() async {
    return await http.get(Uri.parse('$urlBase/reports/categories'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
  }

  Future<Response> getArticles() async {
    print('$urlBase/articles/all');
    return await http.get(Uri.parse('$urlBase/articles/all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
  }

  Future<Response> sendAuthData(String usr, String pass) async {
    return await http.post(
      Uri.parse('$urlBase/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'No_control': usr,
        'password': pass,
      }),
    );
  }

  Future<Response> sendToken(String token) async {
    print(token);
    return await http.get(
      Uri.parse('$urlBase/auth/renew'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
  }

    Future<Response> requestLocation(String id) async {

      print('$urlBase/location/'+id);
    return await http.get(
      Uri.parse('$urlBase/location/'+id),
    );
  }

}
