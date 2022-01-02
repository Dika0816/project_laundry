import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_laundry/models/jenis_laundry.dart';
import 'package:project_laundry/models/jenis_pakaian.dart';
import 'package:project_laundry/pages/finish_page.dart';
import 'package:project_laundry/widgets/const.dart';

class PembayaranPage extends StatefulWidget {
  static const routeName = 'konfirmasi';
  const PembayaranPage({
    Key? key,
    required this.pilihLaundry,
    required this.pilihPakaian,
  }) : super(key: key);

  final List<JenisLaundry> pilihLaundry;
  final List<JenisPakaian> pilihPakaian;

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final formater = NumberFormat('#,##0.00', 'id');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pembayaran',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: contentBody(context),
    );
  }

  Widget contentBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    contentOperator(),
                    SizedBox(height: 8.0),
                    contentPelanggan(),
                    SizedBox(height: 8.0),
                    contentDetailPesanan(),
                    SizedBox(height: 68.0),
                  ],
                );
              },
            ),
            Positioned(
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueGrey,
                ),
                child: FlatButton(
                  child: Text(
                    'Bayar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => FinishPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contentPelanggan() {
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Icon(
              Icons.bubble_chart,
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
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
                    'Pelanggan',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    'Muhammad Abdul Salam',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    'Telp. 085870927601',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    'Jl. Fatmawati No. 177, Kedungmundu, Jawa Tengah, Kota Semarang, Tembalang',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contentOperator() {
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Icon(
              Icons.bubble_chart,
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
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
                    'Operator',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    'Mutakin Akbar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contentDetailPesanan() {
    double total = 0.0;
    if (widget.pilihLaundry != null) {
      for (final item in widget.pilihLaundry) {
        total = total + item.harga;
      }
    }
    if (widget.pilihPakaian != null) {
      for (final item in widget.pilihPakaian) {
        total = total + item.harga;
      }
    }
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Icon(
              Icons.bubble_chart,
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
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
                    'Detail Pesanan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Divider(height: 1, color: Colors.grey[500]),
                  if (widget.pilihLaundry != null) SizedBox(height: 8.0),
                  if (widget.pilihLaundry != null)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.pilihLaundry.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            Icon(Icons.event_note, size: 16),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(widget.pilihLaundry[index].jenis),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Rp ' +
                                    formater.format(
                                        widget.pilihLaundry[index].harga),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  if (widget.pilihLaundry != null) SizedBox(height: 8.0),
                  if (widget.pilihLaundry != null)
                    Divider(height: 1, color: Colors.grey[500]),
                  SizedBox(height: 8.0),
                  if (widget.pilihPakaian != null)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.pilihPakaian.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            Icon(Icons.event_note, size: 16),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(widget.pilihPakaian[index].jenis),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Rp ' +
                                    formater.format(
                                        widget.pilihPakaian[index].harga),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  if (widget.pilihPakaian != null) SizedBox(height: 8.0),
                  if (widget.pilihPakaian != null)
                    Divider(height: 1, color: Colors.grey[500]),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Rp ' + formater.format(total),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Text(
                        'Bayar',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          '(Cash)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Rp ' + formater.format(total),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
