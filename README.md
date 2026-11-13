Nama : Ilman Zidni

NPM : 2506621951

Kelas : PBP B

## Tugas 7

1. *Widget Tree* adalah stuktur data hierarkis yang menentukan di mana setiap elemen harus ditempatkan. Elemen di flutter direpresentasikan sebagai widget. Widget dapat memiliki *parent* dan *child*, sehingga membentuk suatu struktur data *Tree*. Konsep struktur data elemen hierarkis ini mirip HTML.

Sebagai Perbandingan:
```HTML
<!-- HTML -->
<div class="container">
    <h1>Sebuah Judul</h1>
    <p>Sebuah paragraf...</p>
</div>
```

```dart
// Dart (using Flutter)
Container(
  child: Column(
    children: [
      Text('Sebuah Judul'),
      Text('Sebuah paragraf...'),
    ],
  ),
)
```
2. Widget yang dipakai dalam proyek ini adalah:
    1. Untuk layout/tata letak:
        1. Scaffold
        2. AppBar
        3. Padding
        4. Column
        5. Row
        6. Center
        7. Container
        8. SizedBox
        9. GridView.count
    2. Untuk teks dan informasi
        1. Text
        2. Icon
        3. Card
        4. Material
        5. InfoCard (Custom)
        6. ItemCard (Custom)
    3. Untuk interaksi user dan notifikasi (semacam toast)
        1. InkWell
        2. SnackBar
        3. ScaffoldMessenger
3. MaterialApp adalah widget yang umumnya dijadikan sebagai konfigurasi/*parent*/*root widget* utama dalam aplikasi Flutter. MaterialApp menggunakan Material Design yang dirancang/didesain oleh Google. Widget ini umumnya digunakan sebagai *root widget* karena memungkinkan *child widgets*-nya untuk mewarisi properti-properti dan konfigurasi dari *root widget* dan menjadikannya sebagai fondasi dari konfigurasi aplikasi. Widget MaterialApp menyediakan beberapa fasilitas dan konfigurasi/properti yang dapat digunakan aplikasi, seperti navigasi, tema, dan home page.
4. Stateless Widget adalah widget yang tidak mempunyai keadaan internal yang dapat berubah. Konfigurasi atau properti Stateless Widget didapatkan dari parameter saat widget dibuat, yang biasanya ditetapkan oleh *parent*-nya. Sedangkan Stateful Widget adalah widget yang mempunyai data keadaan internal yang dapat berubah selama aplikasi berjalan. Data tersebut disimpan di dalam objek `State`.
5. BuildContext adalah referensi/konteks terhadap lokasi suatu widget di dalam *Widget Tree*. BuildContext penting karena Flutter menggunakannya untuk menentukan hubungan antar-widget.
6. Hot Reload adalah fitur untuk menerapkan sebuah perubahan pada kode aplikasi yang sedang berjalan tanpa kehilangan state aplikasi. Hot Restart adalah fitur yang menjalankan ulang kode aplikasi dari awal tanpa menghentikan seluruh *process* aplikasi. Full restart adalah proses menghentikan seluruh kinerja *process* aplikasi dan menjalankannya kembali dari awal secara keseluruhan. Kita tidak bisa hanya mengandalkan hot reload karena saat ada perubahan yang berkaitan dengan inistialisasi aplikasi, state, atau konfigurasi yang berkaitan dengan platform tempat aplikasi berjalan, hot reload tidak cukup untuk menginisialisasi ulang aplikasi.

#### AI Disclosure Pada Tugas 7
*Saya tidak menggunakan AI pada tugas 7.*
