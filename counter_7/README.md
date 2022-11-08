# counter_7

Assignment 7 Flutter project.

## Getting Started

 ### 🔧 Stateful vs Stateless Widget
 Pada Flutter, tiap elemen yang menyusun tampilan aplikasi disebut dengan widget. Selain adanya widget, pada suatu aplikasi flutter terdapat sebuah **state**. State adalah informasi yang terbaca synchronously pada saat widget dibuat dan dapat berubah saat pemakaian widget. Bedrdasarkan sifat statenya, widget pada flutter terbagi menjadi dua yaitu:
 - Stateless Widget
 
 Stateless widget adalah widget yang statenya tidak dapat diubah setelah dibuat. 
 - Stateful Widget
 
 Stateful widget adalah widget yang statenya dapat diubah setelah dibuat.
 
 
 | Stateless Widget | Stateful Widget |
 |------------------|-----------------|
 | Bersifat statik | Bersifat dinamik |
 | Tidak bergantung pada perubahan data | Dapat berubah saat runtime ketika terjadi perubahan data |
 | Tidak memiliki state, hanya akan berubah saat data eksternal berubah | Memiliki state, dapat re-render ketika data atau state berubah |
 | Contoh: Text, Icon, RaisedButton | Contoh: Checkbox, Radio Button, Slider |
 ### 🛠 Widgets I Used
 Berikut adalah widget yang aku gunakan dalam project flutter ini (selain yang ada di template inisial flutter).
 - `Column` - Widget ini memiliki properti children yang mana merupakan array berisi lebih dari 1 widget yang akan diurutkan secara horizontal ke bawah.
 - `Row` - Serupa dengan Column, widget ini memiliki properti children yang mana merupakan array berisi lebih dari 1 widget yang akan diurutkan secara vertikal ke kanan
 - `Text` - Widget ini akan menampilkan string yang terdapat dalam constructornya. Terdapat properti style untuk mengatur tampilan teksnya.
 - `Center` - Widget ini akan memusatkan widget pada properti child nya agar posisinya berada di tengah layar.
 - `Padding` - Widget ini memiliki properti padding yang merupakan class EdgeInsets yang berfungsi untuk memberikan jarak dalam kepada widget child nya.
 - `Visibility` - Widget ini memiliki properti visible yang merupakan nilai boolean. Jika false, widget child tidak akan tersembunyikan dan jika true sebaliknya.
 - `FloatingActionButton` - Widget ini merupakan salah satu widget button pada flutter yang berbentuk lingkaran. Widget button memiliki properti onPressed yang merupakan fungsi yang akan dipanggil ketika tombol ditekan.

 ### ⚙ Interactive App with `setState()`
 Function `setState()` adalah function bawaan dari Class State di Flutter. Kegunaan dari function ini adalah menampikan perubahan nilai dari variabel-variabel yang terdapat di dalam pendefinisian sebuah class State. Ketika function ini dipanggil assignment widget yang menggunakan nilai variabel yang telah diubah akan di rebuild agar menampilkan nilai barunya.  Variabel yang terdapat di dalam StatefulWidget pemilik state tidak akan terdampak karena akan dianggap sebagai data statik. 
 
 ### 🗿 `const` vs `final` in Dart
 Variabel dengan keyword `final` hanya bisa diassign sebuah value sekali yang akan diinisialisasi saat runtime. Sedangkan variabel dengan keyword `const` telah diassing saat runtime dan diinisialisasi saat compile time. Nilai dari variabel ini tidak dapat diubah saat runtime. Hal lain yang membedakan kedua keyword ini adalah `final` dapat digunakan di dalam suatu Class sedangkan `const` hanya bisa digunakan di dalam function. Pada Flutter, ketika suatu state diupdate semua widget pada method build akan di inisialisasi ulang termasuk variabel yang memiliki keyword `final`. Hal tersebut tidak berlaku pada widget yang memiliki keyword `const`.
 
 ### 📝 How I did it
- [x] Membuat sebuah program Flutter baru dengan nama counter_7.
Pada root folder tugas flutter, aku jalankan command
```
flutter create counter_7
```
- [x] Mengubah tampilan program menjadi seperti berikut.

![image](https://user-images.githubusercontent.com/58902925/200447918-b58686df-116b-4881-b2b3-a72394b8e39a.png)

Pada file `lib/main.dart` aku bungkus widget `Text` yang berisi counter dengan widget `Column`. Pada array children dari column tersebut kutambahkan `Text` sebelum counter. String dari text tersebut sementara kuisi dengan "GENAP". Aku juga tambahkan `TextStyle` pada property style dari text ini dan sementara menagatur properti color sebagai `Colors.red`. Setelah itu, aku juga bungkus widget `FloatingActionButton` pada bagian floatingActionButton dari Scaffold dengan Widget `Row`. Kutambahkan sebuah floatingactionbutton sebelum tombol tambah di dalam children dari row tersebut. Pada property child button tersebut, kutambahkan `Icon` dengan menggunakan icon remove. Agar terlihat rapi, aku bungkus kembali widget row tadi dengan widget `Padding` dan memberikan properti padding dengan `EdgeInsets.only(left: 30)`. 



- [x] Tombol + menambahkan angka sebanyak satu satuan.
Implementasi tombol ini sudah disediakan oleh template flutter ketika project ini dibuat.
- [x] Tombol - mengurangi angka sebanyak satu satuan. Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter. 

Pertama, aku buat sebuah function bernama `_decrementCounter`. Di dalamnya, aku panggil function  `setState()` dan statement di dalamnya aku mengurangi nilai counter. Akan tetapi, aku juga taruh sebua if-statement  untuk mencegah counter berkurang jika nilainya sudah 0. Kemudian, pada tombol dengan icon remove, kutambahkan `_decrementCounter` sebagai properti onPressed nya. Berikut potongan kodenya
```Dart
void _decrementCounter() {
  setState(() {
     if (_counter != 0) {
       _counter--;
     }
  });
}
```
- [x] Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru. Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah. Angka 0 dianggap sebagai angka genap.
  
  Di dalam class `_MyHomeState`, tepat setelah pendefinisian variabel `_counter`. Aku mendefinisikan dua variabel yaitu _parity dan _color sebagai berikut.
```Dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _parity = 'GENAP';
  MaterialColor _color = Colors.red;
  
```
  Aku lalu membuat sebuah function bernama `_checkParity` yang akan memanggil function `setState()` dan statement di dalamnya akan mengubah nilai `_parity` dan `_color` sesuai dengan nilai `_counter`. Kemudian, pada function `_incrementCounter` dan `_decrementCounter` aku panggil function ini tiap kali nilai counter diubah. Berikut potongan kodenya.
```Dart
void _checkParity() {
    setState(() {
      if (_counter % 2 == 0) {
        _parity = "GENAP";
        _color = Colors.red;
      } else {
        _parity = "GANJIL";
        _color = Colors.blue;
      }
    });
  }
```
```Dart
void _incrementCounter() {
    setState(() {
      _counter++;
      _checkParity();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
        _checkParity();
      }
    });
  }
```

### Final words
Semangat mengerjakan dan menilai 
