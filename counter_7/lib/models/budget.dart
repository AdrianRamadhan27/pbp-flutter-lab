class Budget {
  String judul;
  int nominal;
  String tipe;
  DateTime tanggal;

  Budget(
      this.judul,
      this.nominal,
      this.tipe,
      this.tanggal
      );
}

List<Budget> budgetList = <Budget>[];