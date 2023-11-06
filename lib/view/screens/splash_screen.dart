import 'package:flutter/material.dart';
import 'package:store_app/view/screens/home_screen.dart';
import 'package:store_app/view/screens/login_screen.dart';
import 'package:store_app/view_model/data/local/shared_keys.dart';
import 'package:store_app/view_model/data/local/shared_prefernce.dart';
import 'package:store_app/view_model/utils/colors.dart';
import 'package:store_app/view_model/utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigation.pushAndRemove(context, (LocalData.get(key:SharedKeys.token)!= null ?HomeScreen():LoginScreen()),);
    });
  }
//(LocalData.get(key:SharedKeys.token)!= null ?HomeScreen():LoginScreen()),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.network(
          "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/store.png",
          width: 250,
        ),
      ),
    );
  }
}
