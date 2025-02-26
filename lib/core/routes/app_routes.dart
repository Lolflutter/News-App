import 'package:flutter/material.dart';
import 'package:news_app/modules/home/pages/home_screen.dart';
import 'package:news_app/news/pages/news_screen.dart';
import '../../modules/splash/pages/splash_screen.dart';
import 'app_routes_name.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.splash: (_) => SplashScreen(),
    AppRoutesName.home: (_) => HomeScreen(),
    AppRoutesName.news: (_) => NewsScreen(),

  };
}
