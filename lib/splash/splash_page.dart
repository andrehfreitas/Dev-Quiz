import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';

class  SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Abri a tela de splash e após 2 segundos vai para a HomePage.
    // pushReplacement remove a Splash Screen da stack de telas e coloca a HomePage que passa a ser a tela 0
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomePage())
    ));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear), 
        child: Center(child: Image.asset(AppImages.logo)),
      ),
    );
  }
}