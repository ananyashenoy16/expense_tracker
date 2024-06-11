import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =ColorScheme.fromSeed(seedColor:const  Color.fromARGB(255, 96, 59, 182));
var kDarkColorScheme=ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125));
void main(){
  runApp(
       MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin:const EdgeInsets.symmetric(
              horizontal: 16,vertical: 8
            )
          )),
        theme:ThemeData.from(colorScheme: kColorScheme,
    
      ),
      themeMode: ThemeMode.system,  //DEFAULT
       home:const Expenses()
      ),
      
    );
  
}  