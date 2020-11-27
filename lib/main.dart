import 'dart:async';
import 'package:flutter/material.dart';
import 'package:appmockapi/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Contador> futureContador;

  @override
  void initState() {
    super.initState();
    futureContador = fetchContador();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Controle Covid-19'),
        ),
        body: Center(
          child: FutureBuilder<Contador>(
            future: futureContador,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.total.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
