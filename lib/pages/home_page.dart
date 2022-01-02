import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_laundry/models/jenis_laundry.dart';
import 'package:project_laundry/models/jenis_pakaian.dart';
import 'package:project_laundry/pages/pembayaran_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formater = NumberFormat('#,##0.00', 'id');
  late List<JenisLaundry> pilihLaundry;
  late List<JenisPakaian> pilihPakaian;

  List<JenisLaundry> jenisLaundry = [
    JenisLaundry(jenis: 'Cuci Kering', harga: 6000, status: false),
    JenisLaundry(jenis: 'Cuci Setrika', harga: 4000, status: false),
    JenisLaundry(jenis: 'Setrika Saja', harga: 3000, status: false),
  ];

  List<JenisPakaian> jenisPakaian = [
    JenisPakaian(jenis: 'Celana Panjang', harga: 4500, status: false),
    JenisPakaian(jenis: 'Celana Pendek', harga: 3500, status: false),
    JenisPakaian(jenis: 'Jaket', harga: 7500, status: false),
    JenisPakaian(jenis: 'Baju Kaos', harga: 3000, status: false),
    JenisPakaian(jenis: 'Baju Anak', harga: 4000, status: false),
    JenisPakaian(jenis: 'Selimut', harga: 8000, status: false),
    JenisPakaian(jenis: 'Sprei', harga: 3500, status: false),
    JenisPakaian(jenis: 'Sarung Bantal', harga: 4000, status: false),
    JenisPakaian(jenis: 'Bed Cover Kecil', harga: 2500, status: false),
    JenisPakaian(jenis: 'Bed Cover Besar', harga: 3500, status: false),
    JenisPakaian(jenis: 'Sepatu', harga: 5000, status: false),
    JenisPakaian(jenis: 'CD', harga: 2000, status: false),
    JenisPakaian(jenis: 'BH', harga: 2000, status: false),
    JenisPakaian(jenis: 'Kemeja', harga: 2500, status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
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
              itemBuilder: (context, idx) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8.0),
                    contentNamaLaundry(),
                    const SizedBox(height: 8.0),
                    contentJenisLaundry(),
                    const SizedBox(height: 8.0),
                    contentJenisPakaian(),
                    const SizedBox(height: 68.0),
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
                child: ElevatedButton(
                  child: const Text(
                    'Pilih Jenis',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PembayaranPage(
                          pilihLaundry: pilihLaundry,
                          pilihPakaian: pilihPakaian,
                        ),
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

  Widget contentNamaLaundry() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(4.0, 8.0),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.bubble_chart, color: Colors.grey[600]),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Clean Laundry',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Bersih seketika dan wangi sepanjang hari',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  Widget contentJenisPakaian() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(4.0, 8.0),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8.0),
            const Text(
              'Jenis Pakaian (Potong)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: jenisPakaian.length,
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    Checkbox(
                      value: jenisPakaian[index].status,
                      onChanged: (value) {
                        setState(() {
                          jenisPakaian[index].status = value!;
                          pilihPakaian = [];
                          for (final jenis in jenisPakaian) {
                            if (jenis.status == true) {
                              pilihPakaian.add(
                                JenisPakaian(
                                  jenis: jenis.jenis,
                                  harga: jenis.harga,
                                  status: jenis.status,
                                ),
                              );
                            }
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Text(jenisPakaian[index].jenis),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Rp ' + formater.format(jenisPakaian[index].harga),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget contentJenisLaundry() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: Offset(4.0, 8.0),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8.0),
            Text(
              'Jenis Laundry (Kiloan)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: jenisLaundry.length,
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    Checkbox(
                      value: jenisLaundry[index].status,
                      onChanged: (value) {
                        setState(() {
                          jenisLaundry[index].status = value!;
                          pilihLaundry = [];
                          for (final jenis in jenisLaundry) {
                            if (jenis.status) {
                              pilihLaundry.add(
                                JenisLaundry(
                                  jenis: jenis.jenis,
                                  harga: jenis.harga,
                                  status: jenis.status,
                                ),
                              );
                            }
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Text(jenisLaundry[index].jenis),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Rp ' + formater.format(jenisLaundry[index].harga),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
