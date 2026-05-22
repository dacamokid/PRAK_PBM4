import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';

class DetailPage extends StatelessWidget {

  final Mahasiswa mahasiswa;

  DetailPage({required this.mahasiswa});

  Widget itemDetail(
    IconData icon,
    String title,
    String value,
  ) {

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.teal,
          ),

          SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              SizedBox(height: 3),

              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.teal,

        title: Text(
          "Profil Saya",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        children: [

          // HEADER
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.teal,

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),

            child: Column(
              children: [

                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/pbw.png'),
                ),
                SizedBox(height: 15),

                Text(
                  mahasiswa.nama,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  mahasiswa.pendidikan,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),

              child: ListView(
                children: [

                  itemDetail(
                    Icons.calendar_month,
                    "Tempat/Tgl Lahir",
                    mahasiswa.ttl,
                  ),

                  itemDetail(
                    Icons.people,
                    "Jenis Kelamin",
                    mahasiswa.gender,
                  ),

                  itemDetail(
                    Icons.home,
                    "Alamat",
                    mahasiswa.alamat,
                  ),

                  itemDetail(
                    Icons.favorite,
                    "Agama",
                    mahasiswa.agama,
                  ),

                  itemDetail(
                    Icons.phone,
                    "No. HP/WA",
                    mahasiswa.hp,
                  ),

                  itemDetail(
                    Icons.email,
                    "Email",
                    mahasiswa.email,
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