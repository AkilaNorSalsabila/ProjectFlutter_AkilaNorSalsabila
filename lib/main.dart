import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menghitung Volume Bangun Ruang',
      // Tema aplikasi dengan warna biru
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Halaman utama aplikasi menggunakan widget MyHomePage
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State MyHomePage untuk menangani perubahan data dan interaksi pengguna
class _MyHomePageState extends State<MyHomePage> {
  // Controller untuk mengontrol nilai yang dimasukkan pengguna pada input field
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _jariJariController = TextEditingController();
  final TextEditingController _tinggiTabungController = TextEditingController();
  // Variabel untuk menampung hasil perhitungan volume
  String _result = '';

  // Method untuk menghitung volume balok
  void _hitungVolumeBalok() {
    double panjang = double.parse(_panjangController.text);
    double lebar = double.parse(_lebarController.text);
    double tinggi = double.parse(_tinggiController.text);
    double volume = panjang * lebar * tinggi;
    setState(() {
      _result = 'Volume Balok: $volume';
    });
  }

  // Method untuk menghitung volume kubus
  void _hitungVolumeKubus() {
    double sisi = double.parse(_sisiController.text);
    double volume = sisi * sisi * sisi;
    setState(() {
      _result = 'Volume Kubus: $volume';
    });
  }

  // Method untuk menghitung volume tabung
  void _hitungVolumeTabung() {
    double jariJari = double.parse(_jariJariController.text);
    double tinggi = double.parse(_tinggiTabungController.text);
    double volume = 3.14 * jariJari * jariJari * tinggi;
    setState(() {
      _result = 'Volume Tabung: $volume';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai kerangka utama aplikasi
    return Scaffold(
      // AppBar sebagai judul aplikasi
      appBar: AppBar(
        title: const Text(
          'Menghitung Volume Bangun Ruang',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // SingleChildScrollView agar konten dapat di-scroll jika melebihi layar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // Column untuk tata letak vertikal elemen-elemen UI
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Input field untuk panjang balok
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Panjang Balok'),
            ),
            // SizedBox untuk memberikan jarak vertikal
            const SizedBox(height: 2),
            // Input field untuk lebar balok
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Lebar Balok'),
            ),
            // SizedBox untuk memberikan jarak vertikal
            const SizedBox(height: 2),
            // Input field untuk tinggi balok
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tinggi Balok'),
            ),
            // SizedBox untuk memberikan jarak vertikal
            const SizedBox(height: 10),
            // Tombol untuk menghitung volume balok
            ElevatedButton(
              onPressed: _hitungVolumeBalok,
             style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Warna latar belakang biru
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks putih
             ),
              child: const Text('Hitung Volume Balok'),
            ),
            // SizedBox untuk memberikan jarak vertikal
            const SizedBox(height: 10),

            // Input field untuk sisi kubus
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Sisi Kubus'),
            ),     const SizedBox(height: 10),
            // Tombol untuk menghitung volume kubus
            ElevatedButton(
              onPressed: _hitungVolumeKubus,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Warna latar belakang biru
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks putih
                 ),
              child: const Text('Hitung Volume Kubus'),
            ),
            const SizedBox(height: 10),
            
            // Input field untuk jari-jari tabung
            TextField(
              controller: _jariJariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Jari-Jari Tabung'),
            ),
            const SizedBox(height: 5),
            // Input field untuk tinggi tabung
            TextField(
              controller: _tinggiTabungController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tinggi Tabung'),
            ),
            // SizedBox untuk memberikan jarak vertikal
            const SizedBox(height: 5),
            // Tombol untuk menghitung volume tabung
            ElevatedButton(
              onPressed: _hitungVolumeTabung,
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Warna latar belakang biru
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks putih
                ),
              child: const Text('Hitung Volume Tabung'),
            ),
            const SizedBox(height: 15),
            // Text untuk menampilkan hasil perhitungan volume
            Text(
              _result,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
