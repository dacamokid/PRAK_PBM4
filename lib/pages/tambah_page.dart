import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/mahasiswa.dart';

class TambahPage extends StatefulWidget {

  @override
  State<TambahPage> createState() =>
      _TambahPageState();
}

class _TambahPageState
    extends State<TambahPage> {

  final nama = TextEditingController();
  final ttl = TextEditingController();
  final gender = TextEditingController();
  final alamat = TextEditingController();
  final agama = TextEditingController();
  final pendidikan = TextEditingController();
  final hp = TextEditingController();
  final email = TextEditingController();

  // SIMPAN DATA
  Future simpanData() async {

    List<Mahasiswa> dataLama =
        await DatabaseHelper.getData();

    int idBaru = dataLama.length + 1;

    Mahasiswa mahasiswa = Mahasiswa(
      id: idBaru,
      nama: nama.text,
      ttl: ttl.text,
      gender: gender.text,
      alamat: alamat.text,
      agama: agama.text,
      pendidikan: pendidikan.text,
      hp: hp.text,
      email: email.text,
    );

    await DatabaseHelper.tambahData(
      mahasiswa,
    );

    Navigator.pop(context, true);
  }

  // INPUT
  Widget input(
    TextEditingController controller,
    String label,
  ) {

    return Padding(
      padding: EdgeInsets.only(bottom: 12),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          labelText: label,

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,

        title: Text(
          "Tambah Mahasiswa",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            input(nama, "Nama"),
            input(ttl, "Tempat, Tanggal Lahir"),
            input(gender, "Jenis Kelamin"),
            input(alamat, "Alamat"),
            input(agama, "Agama"),
            input(pendidikan, "Pendidikan"),
            input(hp, "Nomor HP"),
            input(email, "Email"),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.teal,
                ),

                onPressed: () async {

                  if (nama.text.isEmpty ||
                      ttl.text.isEmpty ||
                      gender.text.isEmpty ||
                      alamat.text.isEmpty ||
                      agama.text.isEmpty ||
                      pendidikan.text.isEmpty ||
                      hp.text.isEmpty ||
                      email.text.isEmpty) {

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Semua data wajib diisi",
                        ),
                      ),
                    );

                    return;
                  }

                  await simpanData();
                },

                child: Text(
                  "Tambah",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}