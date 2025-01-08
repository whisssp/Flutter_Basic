
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../payload/payload.dart';

void navigateTo(BuildContext ctx, Widget targetWidget) {
  Navigator.of(ctx).push(
    MaterialPageRoute(builder: (ctx) => targetWidget)
  );
}

Future<User>? login(String username, String password) async {
  User? user;
  Response? response;
  try {
    response = await http
      .post(Uri.parse('http://172.16.0.146:8080/ping'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password
      })
    ).timeout(const Duration(seconds: 5));
  } catch (_, e) {
    if (response != null && response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
      final  jsonResponse = jsonDecode(response.body);
      user = User.fromJson(jsonResponse as Map<String, dynamic>);
    } else if (response != null && response.statusCode == 400) {
    // If the server did not return a 200 OK response,
    // then throw an exception.=
      throw Exception(jsonDecode(response.body)['message']);
    } else {
      throw Exception('Something went wrong');
    }
  }

  // await Future.delayed(const Duration(seconds: 5));
  return Future<User>.value(user);
}