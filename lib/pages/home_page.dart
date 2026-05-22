import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/mahasiswa.dart';

import 'tambah_page.dart';
import 'detail_page.dart';
import 'edit_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  List<Mahasiswa> listMahasiswa = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future getData() async {

    listMahasiswa =
        await DatabaseHelper.getData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,

        title: Text(
          "Daftar Mahasiswa",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: listMahasiswa.isEmpty

          ? Center(
              child: Text(
                "Belum ada data",
              ),
            )

          : ListView.builder(
              itemCount:
                  listMahasiswa.length,

              itemBuilder:
                  (context, index) {

                final data =
                    listMahasiswa[index];

                return Card(
                  child: ListTile(

                    onTap: () async {

                      await Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              DetailPage(
                            mahasiswa:
                                data,
                          ),
                        ),
                      );

                      getData();
                    },

                    title:
                        Text(data.nama),

                    subtitle: Text(
                      data.pendidikan,
                    ),

                    trailing: Row(
                      mainAxisSize:
                          MainAxisSize.min,

                      children: [

                        IconButton(
                          icon: Icon(
                            Icons.edit,
                          ),

                          onPressed:
                              () async {

                            await Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    EditPage(
                                  mahasiswa:
                                      data,
                                ),
                              ),
                            );

                            getData();
                          },
                        ),

                        IconButton(
                          icon: Icon(
                            Icons.delete,
                          ),

                          onPressed:
                              () async {

                            await DatabaseHelper
                                .hapusData(
                              data.id,
                            );

                            getData();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor: Colors.teal,

        child: Icon(Icons.add),

        onPressed: () async {

          await Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) =>
                  TambahPage(),
            ),
          );

          getData();
        },
      ),
    );
  }
}