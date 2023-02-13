import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // List<Map<String, dynamic>> _data = [];
  String _nama = '';
  String _email = '';
  String _username = '';
  String _role = '';

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nama = prefs.getString('nama') ?? '';
      _email = prefs.getString('email') ?? '';
      _username = prefs.getString('username') ?? '';
      _role = prefs.getString('id_role') ?? '';
    });
    return true;
  }

  _getMenu() async {
    await _getUser();

    if (_role == "1") {
      return [
        {'icon': Icons.group, 'title': 'User', 'route': '/list-user'},
        {'icon': Icons.lock, 'title': 'Role', 'route': '/list-role'},
        {'icon': Icons.monetization_on, 'title': 'Tarif', 'route': '/list-tarif'},
        {
          'icon': Icons.dashboard,
          'title': 'Kategori',
          'route': '/list-kategori'
        },
        {'icon': Icons.tag_sharp, 'title': 'Tag', 'route': '/list-tag'},
        {'icon': Icons.newspaper, 'title': 'Berita', 'route': '/list-berita'},
        {
          'icon': Icons.beach_access,
          'title': 'Peristiwa',
          'route': '/list-peristiwa'
        },
        {'icon': Icons.photo, 'title': 'Galeri', 'route': '/list-galeri'},
        {'icon': Icons.comment, 'title': 'Komentar', 'route': '/list-komentar'},
      ];
    } else {
      return [
        {'icon': Icons.newspaper, 'title': 'Berita', 'route': '/list-berita'},
        {
          'icon': Icons.beach_access,
          'title': 'Peristiwa',
          'route': '/list-peristiwa'
        },
        {'icon': Icons.photo, 'title': 'Galeri', 'route': '/list-galeri'},
        {'icon': Icons.comment, 'title': 'Komentar', 'route': '/list-komentar'},
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border.all(color: Colors.blueGrey, width: 1),
                ),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.person,
                    size: 56,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              FutureBuilder(
                future: _getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        children: [
                          Text(_nama),
                          Text(_email, style: TextStyle(fontSize: 12)),
                          Text(
                            (_role == "1") ? 'Admin' : 'Admin Berita',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff00579c)),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              FutureBuilder<dynamic>(
                future: _getMenu(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic>? data = snapshot.data;
                    // print(data);
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.only(
                                left: 20, top: 5, right: 4, bottom: 5),
                            margin: EdgeInsets.only(
                                bottom: 4, top: 5, left: 15, right: 15),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, data?[index]['route']);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(data?[index]['icon']),
                                    SizedBox(width: 20),
                                    Text(data?[index]['title']),
                                  ]),
                            ));
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 15),
              //   child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/login');
              //       },
              //       child: Text('Login')),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
