import 'package:flutter/material.dart';
import 'package:project_laundry/pages/pesanan_detail.dart';
import 'package:project_laundry/widgets/const.dart';

class PesananPage extends StatefulWidget {
  static const routeName = 'pesanan';
  const PesananPage({Key? key}) : super(key: key);
  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.transparent),
        title: Text('Pesanan', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: contentBody(),
    );
  }

  Widget contentBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kColorsShade,
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                              offset: Offset(4.0, 8.0),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            imageList(),
                            contentList(),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PesananDetailPage(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contentList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Telah Selesai',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              '28/01/2020',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 6.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Laundry Anda telah selesai. Pelanggan',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Order # 36176625516618',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageList() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: Icon(
        Icons.bubble_chart,
        color: Colors.blueGrey,
      ),
    );
  }
}
