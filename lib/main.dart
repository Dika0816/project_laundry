import 'package:flutter/material.dart';
import 'package:project_laundry/pages/finish_page.dart';
import 'package:project_laundry/pages/home_page.dart';
import 'package:project_laundry/pages/login_page.dart';
import 'package:project_laundry/pages/pembayaran_page.dart';
import 'package:project_laundry/pages/pesanan_detail.dart';
import 'package:project_laundry/pages/pesanan_page.dart';
import 'package:project_laundry/pages/profile_page.dart';
import 'package:project_laundry/pages/register_page.dart';
import 'package:project_laundry/pages/setting_page.dart';
import 'package:project_laundry/widgets/const.dart';

void main() {
  //inisialisasi sharedPreference
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laundry Apps',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      //inisialisasi default screen based on sharedpreferences
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        LOGIN_SCREEN: (BuildContext context) => LoginPage(),
        REGISTER_SCREEN: (BuildContext context) => RegisterPage(),
        HOME_SCREEN: (BuildContext context) => HomePage(),
        DETAIL_SCREEN: (BuildContext context) => PesananDetailPage(),
        PROFILE_SCREEN: (BuildContext context) => ProfilePage(),
        PESANAN_SCREEN: (BuildContext context) => PesananPage(),
        SETTING_SCREEN: (BuildContext context) => SettingPage(),
        FINISH_SCREEN: (BuildContext context) => FinishPage(),
      },
    );
  }
}
