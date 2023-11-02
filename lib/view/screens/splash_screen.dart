import 'package:flutter/material.dart';
import 'package:store_app/view/screens/home_screen.dart';
import 'package:store_app/view/screens/login_screen.dart';
import 'package:store_app/view_model/data/local/shared_keys.dart';
import 'package:store_app/view_model/data/local/shared_prefernce.dart';
import 'package:store_app/view_model/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => (LocalData.get(key:SharedKeys.token)!= null ?HomeScreen():LoginScreen()),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.network(
          'https://cdn-icons-png.flaticon.com/512/169/169132.png',
          width: 250,
        ),
      ),
    );
  }
}
