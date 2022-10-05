import 'package:flutter/material.dart';
import 'package:testaxia/axiaListep.dart';
import 'package:testaxia/login.dart';
import 'package:testaxia/recipe.dart';
import 'package:testaxia/register.dart';
import 'package:testaxia/test.dart';

import 'RecipeScreen.dart';



void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: '/',

   home: MyLogin(),
    onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    routes: {

      'register': (context) => const MyRegister(),
      'login': (context) => MyLogin(),
      'test': (context) => MyTest(),
      'axiaListep': (context) => MyaxiaListep(),


    },
  ));
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (context) => MyaxiaListep());
      case  '/Project':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=> RecipeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity:animation,
                child: child,
              );
            }
        );
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(title:const Text("Error"), centerTitle: true),
                body: const Center(
                  child: Text("Page not found"),
                )
            )
        );
    }
  }
}
