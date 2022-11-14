# ASSIGNMENT FLUTTER PBP
Raden Mohamad Adrian Ramadhan Hendar Wibawa

## Daftar Isi
- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)

## Tugas 7

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

## Tugas 8
 ### 📍 Navigator.push vs Navigator.pushReplacement
 Ketika kita memanggil `Navigator.push()` kita akan menambahkan route baru di puncak stack dan ketika kita lakukan `Navigator.pop()` kita akan kembali ke route/halaman sebelumnya.
 
 Sedangkan ketika kita memanggil `Navigator.pushReplacement()`, route yang berada di puncak stack akan dihapus dan digantikan dengan route baru. Setelah itu, ketika kita lakukan `Navigator.pop()` kita akan kembali ke route/halaman sebelum route yang dihapus.
 
 ### 🛠 Widgets I Used 
 Widgets yang kugunakan dalam tugas ini adalah
 - `Drawer` - Tombol pada appbar yang bila ditekan akan memunculkan daftar menu.
 - `TextFormField` - Widget yang menerima input teks masukan dari User.
 - `DropdownButton` - Widget yang memunculkan beberapa opsi kebawah ketika ditekan.
 - `TextButton` - Widget yang memanggil suatu function ketika ditekan.
 - `ListTile` - Sebuah widget yang memiliki atribut leading, title, subtitle, dan trailing yang membentuk sebuah kartu.
 - `ListView` - Sebuah widget yang hanya bisa dibuild dengan salah satu dari beberapa method untuk membuat loop widget berdasarkan sebuah iterable.
 
 ### 🎊 Flutter Events
 Terdapat beberapa event di Flutter yang berfungsi dalam interaktivitas dari aplikasi berikut adalah yang saya gunakan pada project ini:
 - `onPressed` - Akan memanggil properti function yang digunakan ketika widget ditekan. Biasanya ada pada widget jenis Button
 - `onChanged` - Akan memanggil properti function yang digunakan ketika isi value dari widget diubah. Biasanya ada pada widget jenis input/form.
 - `onSaved` - Akan memanggil properti function yang digunakan ketika form disimpan. Biasanya ada pada widget jenis input/form.

 Selain itu ada juga `onTap`, `onDoubleTap`, `onLongPress` dan masih banyak lagi yang bisa diimplementasikan dengan widget `GestureDetector`.
 ### 🧭 How Navigator Works in Flutter
 Navigator adalah widget yang mengelola sekumpulan widget turunan dengan disiplin tumpukan. Banyak aplikasi memiliki navigator di dekat bagian atas hierarki widget mereka untuk menampilkan riwayat logisnya menggunakan Hamparan dengan halaman yang terakhir dikunjungi secara visual di atas halaman lama. Menggunakan pola ini memungkinkan navigator bertransisi secara visual dari satu halaman ke halaman lain dengan memindahkan widget di sekitar overlay. Demikian pula, navigator dapat digunakan untuk menampilkan dialog dengan menempatkan widget dialog di atas halaman saat ini.
 
 ### 📝 How I did it
 Berikut adalah tahapan pengerjaan yang kulakukan dalam tugas 8.
- [x] Menambahkan drawer/hamburger menu pada app yang telah dibuat sebeumnya.

Pada Widget appbar di dalam MyHomePage, kutambahkan sebuah widget `Drawer` pada property drawer. Child nya adalaw sebuah `Column` untuk tombol navigasi yang akan dibuat.

- [x] Menambahkan tiga tombol navigasi pada drawer/hamburger.

Pada properti children dari columnya, kutambahkan array berisi 3 `ListTile` yang jika ditekan akan memanggil callback function `Navigator.pushReplacement` ke masing-masing  page. Caranya dengan mengisi parameter setelah context dengan sebuah MaterialPageRoute dengan properti builder berupa function yang mengembalikan class Widget/Page yang dimaksud.
Contoh potongan kode:
```Dart
ListTile(
  title: const Text('counter_7'),
  onTap: () {
    // Route menu ke halaman utama
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  },
),
```
- [x] Menambahkan halaman form

Membuat sebuah folder di dalam folder lib bernama `models` dan didalamnya buat file sehingga ada directory `models/budget.dart`. Pada file ini aku buat class `Budget` yang memiliki atribut
- `judul` bertipe String
- `nominal` bertipe int
- `tipe` bertipe String
Object ini akan kubuat sebagai model data budget pada form. Di dalam file yang sama, aku juga buat sebuah `List` bertipe budget kosong untuk menyimpan data-data budget yang ditambahkan. Berikut isi  `models/budget.dart`.

```Dart
class Budget {
  String judul;
  int nominal;
  String tipe;

  Budget(
      this.judul,
      this.nominal,
      this.tipe,
      );
}

List<Budget> budgetList = <Budget>[];
```
Setelah itu, aku buat sebuah file baru di folder lib bernama `budget_form_page.dart`. Di dalamnya aku buat sebuah class `BudgetFormPage` yang merupakan subclass dari `StatefulWidget`. Pada state yang dikembalikan ketika function `createState()` dipanggil, aku definisikan beberapa state yang merupakan atribut yang akan disimpan form untuk dijadikan sebuah data `Budget`. 
Berikut adalah state yang kubuat
```Dart
class _BudgetFormPageState extends State<BudgetFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int nominal = 0;
  String tipe = 'Pengeluaran';
  List<String> listTipeBudget = ['Pengeluaran', 'Pemasukan'];

```
Setelah itu, aku buat widget `Form` yang berisi sebuah column beberapa ListTile. Di tiap ListTile kubuat sebuah input mulai dari TextFormField untuk judul dan nominal, DropDownButton untuk tombol pemilihan tipe budget, dan TextButton untuk tombol simpan. Pada bagian onChanged, onSaved aku panggil setState() untuk mengubah nilai state yang telah kudefinisikan. Pada properti onPressed tombol simpan, aku tambahkan objek Budget baru ke dalam list dengan atribut dari state yang sudah dimasukkan.  

- [x] Menambahkan halaman data budget

Aku buat sebuah file baru di folder lib bernama `budget_data_page.dart`. Di dalamnya aku buat sebuah class `BudgetDataPage` yang merupakan subclass dari `StatelessWidget`. Di dalam scaffold nya aku buat sebuah `ListView` menggunakan method `ListView.builder` yang akan melakukan build objek ListTile berdasarkan elemen-elemen di List Budget. Berikut potongan kodenya.
```Dart
body:  ListView.builder(
 itemCount: budgetList.length,
 itemBuilder: (context, index) {
   return ListTile(
     title: Text(
         budgetList[index].judul
     ),
     subtitle: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(
             budgetList[index].nominal.toString()
         ),
         Text(
             budgetList[index].tipe
         ),
         Text(
             "Tanggal: " + budgetList[index].tanggal.toString().substring(0, 10)
         ),
       ],
     ),

   );
 }
),
```

## Final words
Semangat mengerjakan dan menilai 
