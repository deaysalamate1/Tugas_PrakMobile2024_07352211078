// 1. Implementasi Kelas Utama dan Subkelas
class ProdukDigital {
  String namaProduk;
  double harga;
  String kategori;

  ProdukDigital(
      {required this.namaProduk, required this.harga, required this.kategori});

  double terapkanDiskon() {
    if (kategori == 'NetworkAutomation' && harga >= 200000) {
      harga = harga * 0.85; // Diskon 15%
      if (harga < 200000) {
        harga = 200000; // Harga minimal 200000
      }
    }
    return harga;
  }
}

// Kelas abstrak Karyawan dan Subkelas KaryawanTetap dan KaryawanKontrak
abstract class Karyawan {
  String nama;
  int umur;
  String peran;

  Karyawan({required this.nama, required this.umur, required this.peran});

  void bekerja();
}

mixin Kinerja {
  int produktivitas = 100;

  void updateProduktivitas() {
    if (produktivitas < 100) {
      produktivitas += 10;
    }
  }
}

class KaryawanTetap extends Karyawan with Kinerja {
  KaryawanTetap(
      {required String nama, required int umur, required String peran})
      : super(nama: nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    if (peran == 'Manager' && produktivitas < 85) {
      throw Exception('Produktivitas manager harus lebih dari 85!');
    }
    print(
        '$nama bekerja pada hari kerja reguler dengan produktivitas $produktivitas.');
  }
}

class KaryawanKontrak extends Karyawan with Kinerja {
  KaryawanKontrak(
      {required String nama, required int umur, required String peran})
      : super(nama: nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print(
        '$nama bekerja pada proyek spesifik dengan produktivitas $produktivitas.');
  }
}

// 4. Enum FaseProyek untuk Konsistensi Proyek
enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

class Proyek {
  FaseProyek fase = FaseProyek.Perencanaan;
  int karyawanAktif = 0;
  int hariJalan = 0;

  void ubahFase() {
    if (fase == FaseProyek.Perencanaan && karyawanAktif >= 5) {
      fase = FaseProyek.Pengembangan;
    } else if (fase == FaseProyek.Pengembangan && hariJalan > 45) {
      fase = FaseProyek.Evaluasi;
    }
    print('Fase proyek saat ini: $fase');
  }
}

// 5. Mekanisme Pembatasan Jumlah Karyawan Aktif
class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < 20) {
      karyawanAktif.add(karyawan);
    } else {
      print("Batas jumlah karyawan aktif tercapai!");
    }
  }

  void resignKaryawan(Karyawan karyawan) {
    if (karyawanAktif.contains(karyawan)) {
      karyawanAktif.remove(karyawan);
      karyawanNonAktif.add(karyawan);
    }
  }
}

// Main untuk menguji implementasi
void main() {
  // ProdukDigital
  ProdukDigital produk = ProdukDigital(
      namaProduk: 'Router X', harga: 250000, kategori: 'NetworkAutomation');
  print('Harga setelah diskon: ${produk.terapkanDiskon()}');

  // Karyawan
  KaryawanTetap karyawanTetap =
      KaryawanTetap(nama: 'Budi', umur: 30, peran: 'Developer');
  KaryawanKontrak karyawanKontrak =
      KaryawanKontrak(nama: 'Andi', umur: 25, peran: 'NetworkEngineer');

  karyawanTetap.bekerja();
  karyawanKontrak.bekerja();

  // Kinerja
  karyawanTetap.updateProduktivitas();
  karyawanKontrak.updateProduktivitas();

  // Proyek
  Proyek proyek = Proyek();
  proyek.karyawanAktif = 5;
  proyek.ubahFase();

  // Perusahaan
  Perusahaan perusahaan = Perusahaan();
  perusahaan.tambahKaryawan(karyawanTetap);
  perusahaan.tambahKaryawan(karyawanKontrak);
  perusahaan.resignKaryawan(karyawanTetap);

  print('Jumlah karyawan aktif: ${perusahaan.karyawanAktif.length}');
  print('Jumlah karyawan non-aktif: ${perusahaan.karyawanNonAktif.length}');
}
