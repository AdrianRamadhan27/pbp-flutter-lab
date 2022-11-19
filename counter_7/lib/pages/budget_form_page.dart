import 'package:flutter/material.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/pages/budget_data_page.dart';

import 'package:counter_7/widgets/my_drawer_.dart';
import 'package:counter_7/models/budget.dart';
import 'package:flutter/services.dart';

class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int nominal = 0;
  String tipe = 'Pengeluaran';
  List<String> listTipeBudget = ['Pengeluaran', 'Pemasukan'];
  DateTime tanggal = DateTime.now();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Form'),
      ),
      drawer: const MyDrawer(),
      body:  Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Kertas HVS",
                      labelText: "Judul",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: "Nominal",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak bisa kosong!';
                      }
                      final n = int.tryParse(value);
                      if (n == null) {
                        return 'Nominal harus berupa angka!';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Pilih Jenis',
                  ),
                  trailing: DropdownButton(
                    value: tipe,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listTipeBudget.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        tipe = newValue!;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: Text(
                    (tanggal == null)?"Mohon pilih tanggal":"Tanggal: " + tanggal.toString().substring(0, 10),
                  ),
                  trailing: ElevatedButton(
                    child: const Text(
                      "Pilih",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                      ).then((date) {
                        setState(() {
                          tanggal = date!;
                        });
                      }
                      );
                    },
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // widget.daftarBudget.add(Budget(_judul, nominal, tipe));
                      budgetList.add(Budget(_judul, nominal, tipe, tanggal));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Success'),
                              content: Text(
                                  "Budget berhasil ditambahkan!"
                                  // _daftarBudget[0].judul
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Oke"
                                    ),
                                )
                              ],
                            );
                          }
                      );

                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}