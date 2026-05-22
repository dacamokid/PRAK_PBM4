import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/mahasiswa.dart';

class EditPage extends StatefulWidget {

  final Mahasiswa mahasiswa;

  EditPage({
    required this.mahasiswa,
  });

  @override
  State<EditPage> createState() =>
      _EditPageState();
}

class _EditPageState
    extends State<EditPage> {

  late TextEditingController nama;
  late TextEditingController ttl;
  late TextEditingController gender;
  late TextEditingController alamat;
  late TextEditingController agama;
  late TextEditingController pendidikan;
  late TextEditingController hp;
  late TextEditingController email;

  @override
  void initState() {
    super.initState();

    nama = TextEditingController(
      text: widget.mahasiswa.nama,
    );

    ttl = TextEditingController(
      text: widget.mahasiswa.ttl,
    );

    gender = TextEditingController(
      text: widget.mahasiswa.gender,
    );

    alamat = TextEditingController(
      text: widget.mahasiswa.alamat,
    );

    agama = TextEditingController(
      text: widget.mahasiswa.agama,
    );

    pendidikan = TextEditingController(
      text: widget.mahasiswa.pendidikan,
    );

    hp = TextEditingController(
      text: widget.mahasiswa.hp,
    );

    email = TextEditingController(
      text: widget.mahasiswa.email,
    );
  }

  // UPDATE DATA
  Future updateData() async {

    Mahasiswa mahasiswaBaru =
        Mahasiswa(
      id: widget.mahasiswa.id,

      nama: nama.text,
      ttl: ttl.text,
      gender: gender.text,
      alamat: alamat.text,
      agama: agama.text,
      pendidikan: pendidikan.text,
      hp: hp.text,
      email: email.text,
    );

    await DatabaseHelper.updateData(
      mahasiswaBaru,
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
          "Edit Mahasiswa",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: SingleChildScrollView(
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
                  style:
                      ElevatedButton.styleFrom(
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

                    await updateData();
                  },

                  child: Text(
                    "Simpan",
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
      ),
    );
  }
}