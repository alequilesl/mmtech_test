
import 'package:flutter/material.dart';
import 'package:mmtech_test/views/auth/login.dart';
import 'package:mmtech_test/views/auth/register.dart';
import 'package:mmtech_test/views/chess_player_profile.dart';
import 'package:mmtech_test/views/home/home.dart';
import 'package:mmtech_test/views/profile/profile.dart';
import 'package:mmtech_test/views/splash/splah.dart';

class RouteName
{
  static String splash= '/splash';
  static String  home= '/';
  static String  authLogin= '/auth/login';
  static String  authRegister= '/auth/register';
  static String  profile= '/profile';
  static String  about= '/about';

  static String  chess_player_profile= '/chess_player_profile';
}

Map<String, WidgetBuilder> routes= {
  RouteName.splash: (context) => const Splash(),
  RouteName.home: (context) => const Home(),
  RouteName.authLogin: (context) => const Login(),
  RouteName.authRegister: (context) => const Register(),
  RouteName.profile: (context) => const Profile(),

  RouteName.chess_player_profile: (context) => const ChessPlayerProfile(),
};