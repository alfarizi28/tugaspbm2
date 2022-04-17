// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:tugaspbm2/detailRumah.dart';
import 'package:tugaspbm2/modelRumah.dart';

class TampilanAwal extends StatefulWidget {
  const TampilanAwal({Key? key}) : super(key: key);

  @override
  State<TampilanAwal> createState() => _TampilanAwal();
}

class _TampilanAwal extends State<TampilanAwal> {
  int idRumah = 0;

  static List<String> namaRumah = [
    'Rumah Joglo',
    'Rumah Gadang',
    'Rumah Honai',
    'Rumah Panjang',
    'Rumah Betang',
    'Rumah Tongkonan',
    'Rumah Sasadu',
  ];

  static List gambar = [
    'images/joglo.jpg',
    'images/gadang.jpg',
    'images/honai.jpg',
    'images/panjang.jpg',
    'images/betang.jpg',
    'images/tongkonan.jpg',
    'images/sasadu.jpg',
  ];

  static List<String> deskripsi = [
    'Rumah adat Joglo merupakan rumah tradisional yang memiliki material utama dari kayu jati. Biasanya Joglo dibangun oleh masyarakat dengan status sosial tinggi seperti kalangan bangsawan atau kerajaan, karena membutuhkan biaya yang besar',
    'Rumah Gadang adalah rumah tradisional dari suku minangkabau. Menurut bentuknya, rumah adat ini disebut rumah gonjong atau rumah bagonjong (rumah bergonjong), karena bentuk atapnya yang bergonjong runcing menjulang. Jika menurut ukurannya, tergantung pada jumlah lanjarnya ( ruas dari depan ke belakang ).',
    'Rumah adat Honai adalah rumah bagi suku Dani yang tinggal di bagian lembah Baliem atau Wamena, suku Lani di Pegunungan Toli, dan suku-suku asli Papua lainnya. Rumah Honai terdiri atas 3 jenis, yaitu: Honai: Rumah untuk para lelaki. Ebei: Rumah untuk para wanita. Wamai: Rumah untuk ternak.',
    'Secara singkat, rumah panjang adalah pusat segala aktivitas sosial, budaya, edukasi, ekonomi dan politik masyarakat suku Dayak. Rumah panjang adalah pusat kebudayaan bagi masyarakat suku Dayak. Maka Rumah panjang merupakan jantung kehidupan masyarakat suku Dayak.',
    'Rumah betang adalah rumah adat di Kalimantan yang menjadi tempat tinggal suku Dayak yang ada di seluruh Pulau Kalimantan. Lazimnya Rumah Betang dapat banyak dilihat di perkampungan suku Dayak yang berada di sekitar hulu sungai.',
    'Tongkonan adalah rumah adat masyarakat Toraja. Tongkonan berasal dari kata tongkon yang artinya duduk bersama-sama. Suku Toraja yang memiliki rumah adat ini pegunungan yang berbatasan dengan Kabupaten Enrekang, Sulawesi Selatan. Rumah adat ini merupakan salah satu ikon suku Toraja selain upacara pemakamannya.',
    'Sasadu merupakan rumah adat suku bangsa Sahu di Halmahera Barat yang juga merupakan suku bangsa asli dan tertua yang ada di daerah tersebut. Di rumah ini, masyarakat adat Sahu biasa berkumpul dalam pertemuan-pertemuan. Di Halmahera Barat, rumah ini lazim ditemui di setiap desa.'
  ];

  // ignore: non_constant_identifier_names
  final List<RumahModel> DataRumah = List.generate(
      namaRumah.length,
      (index) => RumahModel(
          '${namaRumah[index]}', '${gambar[index]}', '${deskripsi[index]}'));

  @override
  void initState() {
    super.initState();
    idRumah = 0;
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  "Katalog Rumah Adat",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 250, 199, 128),
            ),
            body: (isLandscape)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: lebar * 0.5,
                          child: ListView.builder(
                            itemCount: DataRumah.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(DataRumah[index].nama),
                                  leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(DataRumah[index].gambar)),
                                  onTap: () => setState(() => idRumah = index),
                                ),
                              );
                            },
                          )),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: tinggi * 0.4,
                              width: lebar * 0.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(gambar[idRumah]),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              namaRumah[idRumah],
                              style: const TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: lebar * 0.5,
                              child: Text(
                                deskripsi[idRumah],
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : ListView.builder(
                    itemCount: DataRumah.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(DataRumah[index].nama),
                            leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(DataRumah[index].gambar)),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => RumahDetail(
                                      dataRumahModel: DataRumah[index]))));
                            }),
                      );
                    },
                  )));
  }
}
