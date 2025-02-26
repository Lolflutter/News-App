import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
 static ThemeData dark =ThemeData(
   scaffoldBackgroundColor:AppColors.dark,
  appBarTheme: AppBarTheme(
   backgroundColor: Colors.transparent,
   centerTitle: true,
   iconTheme: IconThemeData(
    color: AppColors.white,
   ),
   titleTextStyle: TextStyle(color: AppColors.white,fontSize: 20),
 ),
 textTheme: TextTheme(
     bodySmall: TextStyle(
       fontSize: 18,
       color: Colors.white,
     ),
   bodyMedium:  TextStyle(
     fontSize: 20,
     color: Colors.white,
   ),
   bodyLarge:  TextStyle(
     fontSize: 22,
     color: Colors.white,
   )
 )
 );
 static ThemeData light = ThemeData(
  scaffoldBackgroundColor: AppColors.white
 );
}