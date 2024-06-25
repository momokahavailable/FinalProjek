import 'dart:io';
//berfungsi untuk melakukan input atau output melalui terminal

class Kamera {
  String nama;
  Map<String, int> hargaSewa;

  Kamera(this.nama, this.hargaSewa);
  //class ini untuk menyimpan informasi tentang kamera
  //hargaSewa adalah map
}

class Sewa {
  String namaKamera;
  String kategoriSewa;
  int jumlahHari;
  int totalHarga;
  String namaLengkap;
  String email;
  String nomorTelepon;
  String pilihanPembayaran;
  String detailPembayaran;

  Sewa(
    this.namaKamera,
    this.kategoriSewa,
    this.jumlahHari,
    this.totalHarga,
    this.namaLengkap,
    this.email,
    this.nomorTelepon,
    this.pilihanPembayaran,
    this.detailPembayaran,
  );
  //class ini dipergunakan menyimpan banyak informasi
}

void main() {
  List<Kamera> kameraList = [
    Kamera('Canon G7X Mark III', {'1 Hari': 250000, '3 Hari': 750000}),
    Kamera('Sony RX100 VII', {'1 Hari': 300000, '3 Hari': 900000}),
    Kamera('DJI Osmo Action', {'1 Hari': 150000, '3 Hari': 450000}),
  ];

  List<String> pilihanPembayaranList = ['Transfer Via Bank', 'E-Wallet'];

  while (true) {
    // menampilkan dan melakukan pengurutan
    kameraList.sort((a, b) => a.nama.compareTo(b.nama));
    print('Kamera yang tersedia:');
    for (int i = 0; i < kameraList.length; i++) {
      print('${i + 1}. ${kameraList[i].nama}');
    }

    // untuk melakukan pemilihan kamera yang ingin disewa
    stdout.write('Pilih kamera (1-${kameraList.length + 1}): ');
    int pilihanKamera = int.parse(stdin.readLineSync()!);
    if (pilihanKamera == kameraList.length + 1) {
      continue;
    }
    Kamera kameraTerpilih = kameraList[pilihanKamera - 1];
    print('Anda memilih: ${kameraTerpilih.nama}\n');

    // menampilkan kategori dan harga sewa
    print('Kategori sewa untuk ${kameraTerpilih.nama}:');
    List<String> kategoriSewaList = kameraTerpilih.hargaSewa.keys.toList();
    for (int i = 0; i < kategoriSewaList.length; i++) {
      String kategori = kategoriSewaList[i];
      print('${i + 1}. $kategori: Rp ${kameraTerpilih.hargaSewa[kategori]}');
    }
    print('${kategoriSewaList.length + 1}. Kembali');

    // pemilihan kategori paket sewa yang dicantumkan
    stdout.write('Pilih kategori sewa (1-${kategoriSewaList.length + 1}): ');
    int pilihanKategori = int.parse(stdin.readLineSync()!);
    if (pilihanKategori == kategoriSewaList.length + 1) {
      continue; // Kembali ke menu utama
    }
    String kategoriSewa = kategoriSewaList[pilihanKategori - 1];
    int hargaSewa = kameraTerpilih.hargaSewa[kategoriSewa]!;

    // memasukkan jumlah seberapa lama kamera akan disewa
    int jumlahHari = kategoriSewa == '1 Hari' ? 1 : 3;
    int totalHarga = hargaSewa * jumlahHari;
    print('Total harga: Rp $totalHarga\n');

    // pengisian data pribadi sebagai syarat melakukan penyewaan kamera
    stdout.write('Isi kolom dengan nama lengkap: ');
    String namaLengkap = stdin.readLineSync()!;
    stdout.write('Cantumkan alamat email aktif: ');
    String email = stdin.readLineSync()!;
    stdout.write('Isi nomor telepon yang aktif dan dapat dihubungi: ');
    String nomorTelepon = stdin.readLineSync()!;

    // memilih metode mana yang akan dituju untuk melakukan pembayaran sewa
    print('\nPilihan pembayaran yang tersedia:');
    for (int i = 0; i < pilihanPembayaranList.length; i++) {
      print('${i + 1}. ${pilihanPembayaranList[i]}');
    }
    print('${pilihanPembayaranList.length + 1}. Kembali');
    stdout.write('Pilih metode pembayaran (1-${pilihanPembayaranList.length + 1}): ');
    int pilihanMetode = int.parse(stdin.readLineSync()!);
    if (pilihanMetode == pilihanPembayaranList.length + 1) {
      continue; // Kembali ke menu utama
    }
    String pilihanPembayaran = pilihanPembayaranList[pilihanMetode - 1];
    print('Anda telah memilih metode pembayaran: $pilihanPembayaran\n');

    String strukPembayaran = '';
    // jika pilihan pembayaran melalui via Bank
    if (pilihanPembayaran == 'Transfer Via Bank') {
      stdout.write('Pilih salah satu Bank yang anda inginkan (BRI, Mandiri, Jatim): ');
      String pilihanBank = stdin.readLineSync()!;
      strukPembayaran = pilihanBank;
      print('Anda telah melakukan pemilihan $pilihanBank sebagai pembayaran.\n');
    }
    // jika pilihan pembayaran menggunakan E-Wallet
    else if (pilihanPembayaran == 'E-Wallet') {
      stdout.write('Pilih layanan E-Wallet yang anda inginkan (Paypal, Shopee, Dana): ');
      String pilihanEWallet = stdin.readLineSync()!;
      strukPembayaran = pilihanEWallet;
      print('Anda telah melakukan pemilihan $pilihanEWallet sebagai pembayaran.\n');
    }

    // melakukan konfirmasi penyewaan
    print('\n--- Konfirmasi Penyewaan ---');
    print('Nama: $namaLengkap');
    print('Email: $email');
    print('Nomor Telepon: $nomorTelepon');
    print('Kamera: ${kameraTerpilih.nama}');
    print('Kategori Sewa: $kategoriSewa');
    print('Jumlah Hari Sewa: $jumlahHari');
    print('Total Harga: Rp $totalHarga');
    print('Metode Pembayaran: $pilihanPembayaran');
    if (pilihanPembayaran == 'Transfer Via Bank') {
      print('Bank: $strukPembayaran');
    } else if (pilihanPembayaran == 'E-Wallet') {
      print('Layanan E-Wallet: $strukPembayaran');
    }

    stdout.write('\nApakah informasi ini sudah benar? (y/n): ');
    String konfirmasi = stdin.readLineSync()!;

    // Stack untuk menyimpan pesanan sewa
    Stack<Sewa> tumpukanPesanan = Stack<Sewa>();

    if (konfirmasi.toLowerCase() == 'y') {
      // Membuat pesanan sewa dan menambahkannya ke stack
      Sewa pesanan = Sewa(
        kameraTerpilih.nama,
        kategoriSewa,
        jumlahHari,
        totalHarga,
        namaLengkap,
        email,
        nomorTelepon,
        pilihanPembayaran,
        strukPembayaran,
      );
      tumpukanPesanan.push(pesanan);
      print('\nPenyewaan kamera berhasil! Detail akan dikirim ke email Anda.');

      // Menampilkan struk pembayaran
      stdout.write('\nApakah Anda ingin menampilkan struk pembayaran? (y/n): ');
      String tampilkanStruk = stdin.readLineSync()!;
      if (tampilkanStruk.toLowerCase() == 'y') {
        print('\n--- Struk Pembayaran ---');
        print('Nama: ${pesanan.namaLengkap}');
        print('Email: ${pesanan.email}');
        print('Nomor Telepon: ${pesanan.nomorTelepon}');
        print('Kamera: ${pesanan.namaKamera}');
        print('Kategori Sewa: ${pesanan.kategoriSewa}');
        print('Jumlah Hari: ${pesanan.jumlahHari}');
        print('Total Harga: Rp ${pesanan.totalHarga}');
        print('Metode Pembayaran: ${pesanan.pilihanPembayaran}');
        if (pesanan.pilihanPembayaran == 'Transfer Via Bank') {
          print('Bank: ${pesanan.detailPembayaran}');
        } else if (pesanan.pilihanPembayaran == 'E-Wallet') {
          print('Layanan E-Wallet: ${pesanan.detailPembayaran}');
        }
      }
    } else {
      print('\nTerima Kasih Telah Memesan Jasa Kami!');
    }
    //kameraList untuk menyimpan daftar kamera yang terssedia
    //Loop Utama: Menampilkan daftar kamera yang tersedia, memproses input pengguna untuk memilih kamera, kategori sewa, jumlah hari, dan metode pembayaran.
    //Input Data Pengguna: Mengambil input dari pengguna untuk nama, email, nomor telepon, dan metode pembayaran.
    //Konfirmasi dan Penyimpanan Pesanan: Mengkonfirmasi informasi penyewaan dan menyimpan pesanan dalam Stack.
    //Menampilkan Struk Pembayaran: Jika pengguna mengonfirmasi, pesanan disimpan ke Stack dan ditampilkan struk pembayaran jika diminta.
  }
}

class Stack<T> {
  final List<T> _list = [];

  void push(T value) {
    _list.add(value);
  }

  T pop() {
    if (_list.isEmpty) {
      throw StateError('Tidak ada elemen di dalam stack.');
    }
    return _list.removeLast();
  }

  T peek() {
    if (_list.isEmpty) {
      throw StateError('Tidak ada elemen di dalam stack.');
    }
    return _list.last;
  }

  bool get isEmpty => _list.isEmpty;

  int get length => _list.length;
}
