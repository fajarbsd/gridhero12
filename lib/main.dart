import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "GRID dan HERO",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class Karakter {
  late String nama;
  late String gambar;

  Karakter({required this.nama, required this.gambar});
}

class _HomeState extends State<Home> {
  List<Container> karakterModel = []; //init model

  void getKarakterData = [
    //object model
    Karakter(nama: 'Aquaman', gambar: 'aquaman.jpg'),
    Karakter(nama: 'Batman', gambar: 'batman.jpg'),
    Karakter(nama: 'Captain America', gambar: 'captain.jpg'),
    Karakter(nama: 'Catwoman', gambar: 'catwoman.jpg'),
    Karakter(nama: 'Flash', gambar: 'flash.jpg'),
    Karakter(nama: 'Hulk', gambar: 'hulk.jpg'),
    Karakter(nama: 'Ironman', gambar: 'ironamn.jpg'),
    Karakter(nama: 'Spiderman', gambar: 'spiderman.jpg'),
    Karakter(nama: 'Superman', gambar: 'superman.jpg'),
    Karakter(nama: 'Venom', gambar: 'venom.jpg'),
  ];

  // ignore: deprecated_member_use
  // List<Container> daftarSuperhero = [];

  var karakter = [
    {"nama": "Aquaman", "gambar": "aquaman.jpg"},
    {"nama": "Batman", "gambar": "batman.jpg"},
    {"nama": "Captain Amerika", "gambar": "captain.jpg"},
    {"nama": "Catwoman", "gambar": "catwoman.jpg"},
    {"nama": "Flash", "gambar": "flash.jpg"},
    {"nama": "Hulk", "gambar": "hulk.jpg"},
    {"nama": "Ironman", "gambar": "ironman.jpg"},
    {"nama": "Spiderman", "gambar": "spiderman.jpg"},
    {"nama": "Venom", "gambar": "venom.jpg"},
    {"nama": "Superman", "gambar": "superman.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      // final karakternya = karakter[i];
      final String? gambar = karakter[i]["gambar"];

      // daftarSuperhero.add(Container(
      karakterModel.add(Container(
          padding: const EdgeInsets.all(5.0),
          child: Card(
              child: Column(
            children: <Widget>[
              Hero(
                tag: karakter[i]['nama'].toString(),
                child: Material(
                  child: InkWell(
                    //widget animation
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Detail(
                        nama: karakter[i]['nama'],
                        gambar: gambar,
                      ), //redirect to detail
                    )),
                    child: Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover, //image full no padding
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                karakter[i]['nama'].toString(),
                style: const TextStyle(fontSize: 20.0),
              ) // teks superhero list
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Super Hero",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        //get list grid view
        crossAxisCount: 2,
        // children: daftarSuperhero,
        children: karakterModel,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  //class detail superhero
  // ignore: use_key_in_widget_constructors
  const Detail({required this.nama, required this.gambar});
  final String? nama;
  final String? gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Super Hero",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
              height: 240.0,
              child: Hero(
                tag: nama!,
                child: Material(
                  child: InkWell(
                    //widget animation
                    child: Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover, //image full no padding
                    ),
                  ),
                ),
              )),
          BagianNama(
            nama: nama,
          ),
          const BagianIcon(),
          const Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BagianNama({required this.nama});
  final String? nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      //row detail nama, email, dan rating star
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            //style jarak memanjang full width
            child: Column(
              //row - colum nama dan email
              crossAxisAlignment: CrossAxisAlignment.start, //style rata kiri
              children: <Widget>[
                Text(
                  nama!,
                  style: const TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                Text(
                  "$nama\@gmail.com",
                  style: const TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            // row - row icon star dan rating
            children: const <Widget>[
              Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              Text(
                "12",
                style: TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  const BagianIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        // row - colum icon call, message, photo memanggil Iconteks
        children: const <Widget>[
          Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  // detail widget berkolom yang digunakan BagianIcon
  // ignore: use_key_in_widget_constructors
  const Iconteks({required this.icon, required this.teks});
  final IconData? icon;
  final String? teks;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          Text(
            teks!,
            style: const TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  const Keterangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Card(
        //widget card
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify, //style teks align justify
          ),
        ),
      ),
    );
  }
}
