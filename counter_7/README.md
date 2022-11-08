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
 Working on it... 👷‍♂️
- [x] Membuat sebuah program Flutter baru dengan nama counter_7.

- [x] Mengubah tampilan program menjadi seperti berikut.

![image](https://user-images.githubusercontent.com/58902925/200447918-b58686df-116b-4881-b2b3-a72394b8e39a.png)

- [x] Mengimplementasikan logika berikut pada program.

  - [x] Tombol + menambahkan angka sebanyak satu satuan.
  - [x] Tombol - mengurangi angka sebanyak satu satuan. Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.
  - [x] Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.
  - [x] Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.
  - [x] Angka 0 dianggap sebagai angka genap.
