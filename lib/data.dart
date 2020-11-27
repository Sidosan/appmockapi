import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Contador> fetchContador() async {
  final response =
      await http.get('https://5fc1165fcb4d020016fe64fd.mockapi.io/contador');
  if (response.statusCode == 200) {
    return Contador.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha na contagem!');
  }
}

class Contador {
  final int id;
  final int total;

  Contador({this.id, this.total});

  factory Contador.fromJson(Map<String, dynamic> json) {
    return Contador(id: json['id'], total: json['total']);
  }
}
