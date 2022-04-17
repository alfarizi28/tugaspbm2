import 'package:flutter/material.dart';
import 'package:tugaspbm2/modelRumah.dart';

class RumahDetail extends StatelessWidget {
  final RumahModel dataRumahModel;

  const RumahDetail({Key? key, required this.dataRumahModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                dataRumahModel.nama,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 250, 199, 128),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: lebar,
                  height: tinggi * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      image: DecorationImage(
                          image: AssetImage(dataRumahModel.gambar),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: tinggi * 0.03,
                ),
                Text(
                  dataRumahModel.nama,
                  style: const TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: tinggi * 0.03,
                ),
                SizedBox(
                  width: lebar * 0.9,
                  child: Text(
                    dataRumahModel.deskripsi,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
