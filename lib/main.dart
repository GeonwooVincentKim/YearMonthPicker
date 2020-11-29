import 'package:DateLabels/year_month_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      child: MaterialApp(
        title: "Year Month",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => YearMonthPicker(),
        },
        onGenerateRoute: (RouteSettings settings){
          final List<String> pathElements = settings.name.split("/");
          if(pathElements[0] != '') return null;
          if(pathElements[1] == 'food'){

          }
        },
        onUnknownRoute: (RouteSettings settings){
          return MaterialPageRoute(builder: (BuildContext context) => YearMonthPicker());
        },
      )
    );
  }
}