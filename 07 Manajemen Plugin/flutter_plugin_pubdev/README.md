# Laporan Praktikum 07 : Manajemen Plugin

Nama  : Muhammad Farras Awaludin Alwi  
NIM   : 244107060032  
Absen : 12  

---

## Praktikum 1 : Menerapkan Plugin di Project Flutter

**Langkah 1**  
Buatlah sebuah project Flutter baru dengan nama `flutter_plugin_pubdev`.

# Laporan Praktikum 07 : Manajemen Plugin

Nama  : Muhammad Farras Awaludin Alwi  
NIM   : 244107060032  
Absen : 12  

---

## Praktikum 1 : Menerapkan Plugin di Project Flutter

**Langkah 1**  
Buatlah sebuah project Flutter baru dengan nama `flutter_plugin_pubdev`.

**Langkah 2**  
Tambahkan plugin `auto_size_text` menggunakan perintah berikut di terminal.

```bash
flutter pub add auto_size_text
```

Perintah tersebut digunakan untuk menambahkan package atau plugin `auto_size_text` ke dalam project Flutter.

Jika proses berhasil, maka plugin akan muncul pada file `pubspec.yaml` di bagian `dependencies`.

Contoh hasil pada file `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  auto_size_text: ^3.0.0
```

Plugin `auto_size_text` digunakan untuk menampilkan teks yang ukurannya dapat menyesuaikan ruang yang tersedia. Dengan plugin ini, teks dapat mengecil secara otomatis agar tetap muat di dalam widget tertentu.

---

**Langkah 3**  
Buat file baru dengan nama `red_text_widget.dart` di dalam folder `lib`.

Struktur folder project menjadi seperti berikut.

```text
flutter_plugin_pubdev
├── lib
│   ├── main.dart
│   └── red_text_widget.dart
├── pubspec.yaml
```

Kemudian isi file `red_text_widget.dart` dengan kode berikut.

```dart
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  const RedTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

Pada kode tersebut, dibuat class `RedTextWidget` yang merupakan turunan dari `StatelessWidget`.

Untuk sementara, method `build()` masih mengembalikan widget `Container()` kosong. Widget ini nantinya akan diubah menjadi widget `AutoSizeText`.

---

**Langkah 4**  
Tambahkan widget `AutoSizeText`.

Masih di file `red_text_widget.dart`, ubah kode `return Container();` menjadi seperti berikut.

```dart
return AutoSizeText(
  text,
  style: const TextStyle(color: Colors.red, fontSize: 14),
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
);
```

Setelah kode tersebut ditambahkan, akan muncul error.

Error terjadi karena terdapat dua penyebab utama.

Pertama, widget `AutoSizeText` belum dikenali oleh program karena belum menambahkan import package `auto_size_text`.

Kode import yang harus ditambahkan adalah sebagai berikut.

```dart
import 'package:auto_size_text/auto_size_text.dart';
```

Kedua, variabel `text` belum dibuat di dalam class `RedTextWidget`. Pada kode `AutoSizeText(text, ...)`, nilai `text` digunakan sebagai isi teks yang akan ditampilkan, tetapi variabel tersebut belum dideklarasikan.

Oleh karena itu, perlu dibuat variabel `text` dan parameter pada constructor agar teks dapat dikirim dari file lain, misalnya dari `main.dart`.

---

**Langkah 5**  
Buat variabel `text` dan parameter pada constructor.

Kode pada file `red_text_widget.dart` diperbaiki menjadi seperti berikut.

```dart
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  final String text;

  const RedTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(color: Colors.red, fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
```

Pada kode tersebut, ditambahkan variabel `text` dengan tipe data `String`.

```dart
final String text;
```

Variabel tersebut digunakan untuk menyimpan teks yang akan ditampilkan oleh widget `AutoSizeText`.

Kemudian pada constructor ditambahkan parameter `required this.text`.

```dart
const RedTextWidget({
  Key? key,
  required this.text,
}) : super(key: key);
```

Keyword `required` digunakan agar parameter `text` wajib diisi ketika widget `RedTextWidget` dipanggil.

Widget `AutoSizeText` diberi style warna merah dan ukuran font awal sebesar `14`. Properti `maxLines: 2` digunakan agar teks maksimal ditampilkan dalam dua baris. Jika teks tetap tidak cukup, maka bagian akhir teks akan dipotong dan diganti dengan tanda titik-titik karena menggunakan `TextOverflow.ellipsis`.

---

**Langkah 6**  
Tambahkan widget `RedTextWidget` di file `main.dart`.

Pertama, tambahkan import file `red_text_widget.dart` pada bagian atas file `main.dart`.

```dart
import 'package:flutter_plugin_pubdev/red_text_widget.dart';
```

Kemudian tambahkan widget berikut pada bagian `children` di class `_MyHomePageState`.

```dart
Container(
  color: Colors.yellowAccent,
  width: 50,
  child: const RedTextWidget(
    text: 'You have pushed the button this many times:',
  ),
),
Container(
  color: Colors.greenAccent,
  width: 100,
  child: const Text(
    'You have pushed the button this many times:',
  ),
),
```

Kode tersebut digunakan untuk membandingkan tampilan antara widget `AutoSizeText` dan widget `Text` biasa.

Container pertama memiliki lebar `50` dan menggunakan `RedTextWidget` yang di dalamnya terdapat `AutoSizeText`.

Container kedua memiliki lebar `100` dan menggunakan widget `Text` biasa.

Kode lengkap file `main.dart` adalah sebagai berikut.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pubdev/red_text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Plugin Pubdev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Plugin Pubdev'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.yellowAccent,
              width: 50,
              child: const RedTextWidget(
                text: 'You have pushed the button this many times:',
              ),
            ),
            Container(
              color: Colors.greenAccent,
              width: 100,
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

Setelah kode selesai ditambahkan, jalankan aplikasi dengan menekan tombol **F5** atau menggunakan perintah berikut.

```bash
flutter run
```

Output kode:

![output praktikum 1](img/praktikum1_hasil.jpeg)

Setelah aplikasi dijalankan, terlihat dua tampilan teks yang berbeda.

Pada container berwarna kuning dengan lebar `50`, teks ditampilkan menggunakan `RedTextWidget` yang memakai plugin `AutoSizeText`. Teks dapat menyesuaikan ukuran ruang yang tersedia, berwarna merah, dan maksimal ditampilkan dalam dua baris.

Pada container berwarna hijau dengan lebar `100`, teks ditampilkan menggunakan widget `Text` biasa. Widget `Text` tidak menyesuaikan ukuran font secara otomatis seperti `AutoSizeText`.

Dengan demikian, plugin `auto_size_text` berhasil diterapkan pada project Flutter.

---

---

### Penjelasan

Pada praktikum ini, saya mempelajari cara menambahkan dan menggunakan plugin dari `pub.dev` pada project Flutter.

Plugin yang digunakan adalah `auto_size_text`. Plugin ini berfungsi untuk membuat ukuran teks menyesuaikan ruang yang tersedia secara otomatis.

Project Flutter dibuat dengan nama `flutter_plugin_pubdev`. Setelah itu, plugin ditambahkan menggunakan perintah `flutter pub add auto_size_text`. Perintah tersebut secara otomatis menambahkan dependency plugin ke dalam file `pubspec.yaml`.

Selanjutnya, dibuat file baru bernama `red_text_widget.dart` di dalam folder `lib`. File tersebut berisi class `RedTextWidget` yang digunakan untuk menampilkan teks berwarna merah menggunakan widget `AutoSizeText`.

Pada awalnya, ketika widget `AutoSizeText` langsung digunakan, muncul error. Error tersebut terjadi karena package `auto_size_text` belum di-import dan variabel `text` belum dideklarasikan. Setelah menambahkan import `package:auto_size_text/auto_size_text.dart` dan membuat variabel `text` beserta parameter constructor, error berhasil diperbaiki.

Pada file `main.dart`, widget `RedTextWidget` ditambahkan ke dalam `children` pada class `_MyHomePageState`. Widget tersebut diletakkan di dalam `Container` berwarna kuning dengan lebar `50`. Selain itu, ditambahkan juga widget `Text` biasa di dalam `Container` berwarna hijau dengan lebar `100`.

Hasilnya, widget `AutoSizeText` dapat menyesuaikan ukuran teks agar tetap muat di dalam container yang sempit. Sedangkan widget `Text` biasa tidak memiliki kemampuan menyesuaikan ukuran font secara otomatis.

Dengan demikian, Praktikum 1 berhasil menerapkan plugin `auto_size_text` pada project Flutter.

---

## Tugas Praktikum

### 1. Dokumentasi hasil pekerjaan

Praktikum telah diselesaikan dengan membuat project Flutter bernama `flutter_plugin_pubdev`, menambahkan plugin `auto_size_text`, membuat widget `RedTextWidget`, lalu menampilkan widget tersebut pada halaman utama aplikasi.

Hasil pekerjaan didokumentasikan menggunakan screenshot dan dimasukkan ke dalam folder `img`.

```text
flutter_plugin_pubdev
├── img
│   └── praktikum1_hasil.jpeg
├── lib
│   ├── main.dart
│   └── red_text_widget.dart
├── pubspec.yaml
└── README.md
```

Output hasil pekerjaan:

![output tugas praktikum](img/praktikum1_hasil.jpeg)

---

### 2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!

Langkah 2 berisi perintah untuk menambahkan plugin `auto_size_text` ke dalam project Flutter.

```bash
flutter pub add auto_size_text
```

Maksud dari perintah tersebut adalah mengambil package `auto_size_text` dari `pub.dev` dan menambahkannya ke bagian `dependencies` pada file `pubspec.yaml`.

Dengan adanya dependency tersebut, project Flutter dapat menggunakan class atau widget yang disediakan oleh package `auto_size_text`, salah satunya adalah widget `AutoSizeText`.

Jika plugin belum ditambahkan, maka ketika menggunakan `AutoSizeText`, program tidak akan mengenali widget tersebut dan akan menampilkan error.

---

### 3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!

Langkah 5 digunakan untuk membuat variabel `text` dan menambahkan parameter pada constructor class `RedTextWidget`.

Kode yang ditambahkan adalah sebagai berikut.

```dart
final String text;

const RedTextWidget({
  Key? key,
  required this.text,
}) : super(key: key);
```

Maksud dari kode tersebut adalah agar widget `RedTextWidget` dapat menerima teks dari luar class.

Variabel `text` digunakan untuk menyimpan isi teks yang akan ditampilkan oleh `AutoSizeText`. Karena menggunakan `final`, maka nilai `text` hanya dapat diisi satu kali melalui constructor dan tidak berubah selama widget berjalan.

Parameter `required this.text` berarti setiap kali `RedTextWidget` dipanggil, nilai `text` wajib diberikan. Jika nilai `text` tidak diberikan, maka program akan menampilkan error.

Contoh pemanggilan widget:

```dart
const RedTextWidget(
  text: 'You have pushed the button this many times:',
)
```

Dengan demikian, langkah 5 berfungsi agar widget `RedTextWidget` menjadi widget yang reusable atau dapat digunakan kembali dengan teks yang berbeda-beda.

---

### 4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!

Pada langkah 6 terdapat dua widget yang ditambahkan ke dalam `children`, yaitu `RedTextWidget` dan `Text`.

Kode pertama:

```dart
Container(
  color: Colors.yellowAccent,
  width: 50,
  child: const RedTextWidget(
    text: 'You have pushed the button this many times:',
  ),
),
```

Widget pertama menggunakan `RedTextWidget`. Di dalam `RedTextWidget` terdapat plugin `AutoSizeText`. Fungsi widget ini adalah menampilkan teks yang dapat menyesuaikan ukuran font secara otomatis sesuai dengan ruang yang tersedia.

Container pertama memiliki lebar `50`, sehingga ruang untuk menampilkan teks sangat sempit. Karena menggunakan `AutoSizeText`, ukuran teks akan diperkecil agar dapat menyesuaikan dengan batas container. Selain itu, teks diberi warna merah dan dibatasi maksimal dua baris.

Kode kedua:

```dart
Container(
  color: Colors.greenAccent,
  width: 100,
  child: const Text(
    'You have pushed the button this many times:',
  ),
),
```

Widget kedua menggunakan widget bawaan Flutter, yaitu `Text`. Fungsi widget ini adalah menampilkan teks biasa tanpa penyesuaian ukuran font secara otomatis.

Perbedaannya adalah `RedTextWidget` menggunakan `AutoSizeText`, sedangkan widget kedua menggunakan `Text` biasa. `AutoSizeText` dapat mengecilkan ukuran font agar teks tetap muat pada ruang yang tersedia, sedangkan `Text` biasa hanya menampilkan teks sesuai ukuran default dan tidak otomatis mengecilkan ukuran font.

Selain itu, container pertama memiliki lebar `50` dan berwarna kuning, sedangkan container kedua memiliki lebar `100` dan berwarna hijau. Perbedaan lebar container ini digunakan untuk melihat perbandingan tampilan teks pada ruang yang berbeda.

---

### 5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin `auto_size_text` berdasarkan dokumentasi!

Berdasarkan dokumentasi package `auto_size_text`, widget `AutoSizeText` memiliki beberapa parameter yang digunakan untuk mengatur tampilan dan perilaku teks.

Contoh penggunaan pada praktikum:

```dart
AutoSizeText(
  text,
  style: const TextStyle(color: Colors.red, fontSize: 14),
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
);
```

Penjelasan parameter yang digunakan pada praktikum:

| Parameter | Penjelasan |
| --- | --- |
| `text` | Berisi teks yang akan ditampilkan pada layar. Pada praktikum ini, nilai `text` berasal dari constructor `RedTextWidget`. |
| `style` | Digunakan untuk mengatur tampilan teks, seperti warna, ukuran font, ketebalan, dan lain-lain. Pada praktikum ini, teks diberi warna merah dan ukuran font awal `14`. |
| `maxLines` | Digunakan untuk menentukan jumlah maksimal baris teks. Pada praktikum ini, teks dibatasi maksimal `2` baris. |
| `overflow` | Digunakan untuk menentukan bagaimana teks ditampilkan jika melebihi ruang yang tersedia. Pada praktikum ini digunakan `TextOverflow.ellipsis`, sehingga teks yang terlalu panjang akan dipotong dan diberi tanda titik-titik. |

Parameter lain pada `AutoSizeText` berdasarkan dokumentasi:

| Parameter | Penjelasan |
| --- | --- |
| `key` | Digunakan untuk mengontrol bagaimana widget menggantikan widget lain di dalam widget tree. |
| `textKey` | Digunakan untuk memberikan key pada widget `Text` yang dihasilkan oleh `AutoSizeText`. |
| `style` | Digunakan untuk menentukan gaya teks yang akan ditampilkan. |
| `strutStyle` | Digunakan untuk mengatur tinggi baris minimum dan metrik layout vertikal pada teks. |
| `minFontSize` | Digunakan untuk menentukan ukuran font terkecil ketika teks menyesuaikan ukuran. Nilai default-nya adalah `12`. |
| `maxFontSize` | Digunakan untuk menentukan ukuran font terbesar yang boleh digunakan ketika teks menyesuaikan ukuran. |
| `stepGranularity` | Digunakan untuk menentukan ukuran langkah pengurangan font saat `AutoSizeText` mencoba menyesuaikan teks ke dalam batas ruang yang tersedia. |
| `presetFontSizes` | Digunakan untuk menentukan daftar ukuran font tertentu yang boleh digunakan. Jika parameter ini digunakan, maka `minFontSize`, `maxFontSize`, dan `stepGranularity` akan diabaikan. |
| `group` | Digunakan untuk menyamakan atau menyinkronkan ukuran font beberapa widget `AutoSizeText` yang berada dalam satu group. |
| `textAlign` | Digunakan untuk mengatur perataan teks secara horizontal, misalnya kiri, kanan, tengah, atau rata kanan-kiri. |
| `textDirection` | Digunakan untuk menentukan arah teks, misalnya kiri ke kanan atau kanan ke kiri. |
| `locale` | Digunakan untuk memilih font berdasarkan bahasa atau wilayah tertentu. |
| `softWrap` | Digunakan untuk menentukan apakah teks boleh turun ke baris baru pada pemisah baris lunak. |
| `wrapWords` | Digunakan untuk menentukan apakah kata yang tidak muat dalam satu baris boleh dipindahkan ke baris berikutnya. Nilai default-nya adalah `true`. |
| `overflow` | Digunakan untuk mengatur bagaimana teks ditampilkan ketika melebihi ruang yang tersedia. |
| `overflowReplacement` | Digunakan untuk menampilkan widget pengganti jika teks tetap tidak muat di dalam batas ruang yang tersedia. |
| `textScaleFactor` | Digunakan untuk mengatur faktor skala teks. Parameter ini juga memengaruhi `minFontSize`, `maxFontSize`, dan `presetFontSizes`. |
| `maxLines` | Digunakan untuk menentukan jumlah maksimal baris teks yang boleh ditampilkan. |
| `semanticsLabel` | Digunakan untuk memberikan label alternatif untuk kebutuhan aksesibilitas. |
| `textSpan` | Digunakan pada constructor `AutoSizeText.rich()` untuk menampilkan teks dengan beberapa style berbeda menggunakan `TextSpan`. |

Dengan parameter-parameter tersebut, `AutoSizeText` dapat digunakan untuk mengatur teks agar lebih fleksibel, terutama pada tampilan yang memiliki batas ukuran tertentu.

---

### 6. Kesimpulan

Pada Jobsheet 7 ini, saya mempelajari cara melakukan manajemen plugin pada Flutter.

Plugin yang digunakan adalah `auto_size_text`, yaitu plugin yang berfungsi untuk membuat ukuran teks menyesuaikan ruang yang tersedia secara otomatis.

Langkah pertama yang dilakukan adalah membuat project Flutter baru dengan nama `flutter_plugin_pubdev`. Setelah itu, plugin ditambahkan menggunakan perintah `flutter pub add auto_size_text`.

Selanjutnya, dibuat file `red_text_widget.dart` yang berisi widget `RedTextWidget`. Widget tersebut menggunakan `AutoSizeText` untuk menampilkan teks berwarna merah yang dapat menyesuaikan ukuran font secara otomatis.

Pada file `main.dart`, dilakukan perbandingan antara `RedTextWidget` yang menggunakan `AutoSizeText` dan widget `Text` biasa. Hasilnya, `AutoSizeText` lebih fleksibel karena dapat menyesuaikan ukuran teks dengan batas ukuran container.

Dengan demikian, praktikum ini berhasil menerapkan plugin dari `pub.dev` ke dalam project Flutter dan memahami fungsi dasar dari plugin `auto_size_text`.

---

### 7. Pengumpulan

Laporan praktikum dikumpulkan dalam bentuk link repository GitHub kepada dosen.