import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/config/const.dart';
import 'package:news/main-page/home/berita/detail-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/service.dart';

class DetailKategoriPage extends StatefulWidget {
  var id_kategori;
  var nama_kategori;
  DetailKategoriPage({Key? mykey, this.id_kategori, this.nama_kategori})
      : super(key: mykey);

  @override
  State<DetailKategoriPage> createState() => _DetailKategoriPageState();
}

class _DetailKategoriPageState extends State<DetailKategoriPage> {
  Service service = Service();
  late Future<List<BeritaModel>> listBerita;

  @override
  void initState() {
    super.initState();
    // print(widget.id_kategori);
    listBerita = service.getBeritaKategori(int.parse(widget.id_kategori));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00579c),
        title: Text(widget.nama_kategori),
      ),
      body: FutureBuilder<List<BeritaModel>>(
        future: listBerita,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BeritaModel> data = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Detail(
                            berita: data[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            // imageUrl + data[index].media,
                            imageUrl + data[index].media,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            data[index].judul,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 11,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              data[index].tanggal,
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Data Kosong'),
            );
          }
        },
      ),
    );
  }
}
