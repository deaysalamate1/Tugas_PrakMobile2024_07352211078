abstract class Komputer {
  String nama;
  num kecepatanProsesor; // dalam GHz

  Komputer(this.nama, this.kecepatanProsesor);

  void tingkatkanPerforma(num kenaikan);
  void tampilkanInfo();
}

mixin DayaBaterai {
  void isiBaterai() {
    print("Mengisi daya baterai...");
  }
}

class Laptop extends Komputer with DayaBaterai {
  int jumlahPortUSB;

  Laptop(String nama, num kecepatanProsesor, this.jumlahPortUSB)
      : super(nama, kecepatanProsesor);

  @override
  void tingkatkanPerforma(num kenaikan) {
    kecepatanProsesor += kenaikan;
    print("$nama meningkatkan performa menjadi $kecepatanProsesor GHz.");
  }

  @override
  void tampilkanInfo() {
    print(
        "Nama Laptop: $nama, Kecepatan Prosesor: $kecepatanProsesor GHz, Port USB: $jumlahPortUSB");
  }
}

class Desktop extends Komputer {
  num kapasitasPenyimpanan;

  Desktop(String nama, num kecepatanProsesor, this.kapasitasPenyimpanan)
      : super(nama, kecepatanProsesor);

  @override
  void tingkatkanPerforma(num kenaikan) {
    kecepatanProsesor += kenaikan;
    print("$nama meningkatkan performa menjadi $kecepatanProsesor GHz.");
  }

  @override
  void tampilkanInfo() {
    print(
        "Nama Desktop: $nama, Kecepatan Prosesor: $kecepatanProsesor GHz, Kapasitas Penyimpanan: $kapasitasPenyimpanan GB");
  }
}

void main() {
  Laptop laptopSaya = Laptop("MacBook", 2.5, 2);
  laptopSaya.tingkatkanPerforma(1.5);
  laptopSaya.tampilkanInfo();
  laptopSaya.isiBaterai();

  Desktop desktopSaya = Desktop("Dell", 3.0, 512);
  desktopSaya.tingkatkanPerforma(0.5);
  desktopSaya.tampilkanInfo();
}
