import 'package:flutter/material.dart';
import 'package:flutter_restapi/app/auth/login.dart';
import 'package:flutter_restapi/app/auth/signup.dart';
import 'package:flutter_restapi/app/auth/success.dart';
import 'package:flutter_restapi/app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'restapi',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      initialRoute:sharedPref.getString('id') == null ? 'LogIn' : 'Home',
      routes:  <String, WidgetBuilder> {
        'LogIn' : (context) => LogIn(),
        'SignUp' : (context) => SignUp(),
        'Success' : (context) => Success(),
        'Home' : (context) => const Home(),
      },
    );
  }
}
