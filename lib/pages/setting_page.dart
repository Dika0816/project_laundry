import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_laundry/pages/login_page.dart';

class SettingPage extends StatefulWidget {
  static const routeName = 'setting';
  const SettingPage({Key? key}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Pengaturan', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: contentBody(context),
    );
  }

  Widget contentBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 8.0),
          informasiAkun(),
          Divider(height: 1),
          alamatSaya(),
          Divider(height: 1),
          pesan(),
          SizedBox(height: 8.0),
          perlindunganPrivasi(),
          Divider(height: 1),
          kebijakan(),
          Divider(height: 1),
          bantuan(),
          SizedBox(height: 8.0),
          keluar(context),
        ],
      ),
    );
  }

  Widget keluar(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Keluar',
                  style: TextStyle(color: Colors.red[700]),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  Widget bantuan() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Bantuan'),
            ),
          ),
        ),
      ],
    );
  }

  Widget kebijakan() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Kebijakan'),
            ),
          ),
        ),
      ],
    );
  }

  Widget perlindunganPrivasi() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Perlindungan Privasi'),
            ),
          ),
        ),
      ],
    );
  }

  Widget pesan() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Pesan'),
                  SizedBox(height: 4.0),
                  Text(
                    'Menerima informasi terbaru semua hal yang penting! :)',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget alamatSaya() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Alamat Saya'),
            ),
          ),
        ),
      ],
    );
  }

  Widget informasiAkun() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Informasi Akun'),
            ),
          ),
        ),
      ],
    );
  }
}
