class Berita{
  late String judul;
  late String content;
  late String content_full;
  late String pubDate;
  late String image;

  Berita(this.judul, this.content, this.content_full,this.pubDate, this.image);
}

List<Berita> travel = travelData.map((item) => Berita(item['judul'].toString(),item['content'].toString(),item['content_full'].toString(), item['pubDate'].toString(),item['image'].toString())).toList();

var travelData = [
  {
    "judul" : "\"4 Terobosan untuk Tingkatkan Angka Vaksinasi COVID-19 di Daerah\"",
    "content": "Angka Vaksinasi COVID-19 masih perlu digenjot oleh Pemerintah Daerah,Setidaknya per 24 Desember 2021 masih ada 14 Provinsi dengan cakupan Vaksinasi Dosis 1 di bawah 70%, yakni provinsi Sumsel, NTT, Sulsel, Sumbar, Kalsel, Kalbar, Sulteng, Sultra, Sulbar, Maluku Utara, Maluku, Aceh, Papua Barat, dan Papua",
    "content_full": "Angka Vaksinasi COVID-19 masih perlu digenjot oleh Pemerintah Daerah. Setidaknya per 24 Desember 2021 masih ada 14 Provinsi dengan cakupan Vaksinasi Dosis 1 di bawah 70%, yakni provinsi Sumsel, NTT, Sulsel, Sumbar, Kalsel, Kalbar, Sulteng, Sultra, Sulbar, Maluku Utara, Maluku, Aceh, Papua Barat, dan Papua. Di sisi lain, baru ada 4 Provinsi dengan cakupan Vaksinasi Dosis 2 di atas 70%, yakni DKI Jakarta, Bali, DIY, dan Kepulauan Riau. Pemerintah daerah yang cakupan vaksinasinya masih rendah bisa meniru terobosan pelaksanaan vaksin berbasis banjar (kampung) yang dilakukan di Bali, atau vaksinasi berbasis Rukun Warga (RW) yang dilakukan di DKI Jakarta. Keduanya melibatkan tokoh publik dan masyarakat untuk mendorong pelaksanaan vaksinasinya.  Atau dengan membuat sentra vaksinasi yang mudah di jangkau di daerah tersebut, walau harus sigap mengantisipasi tantangan seperti lansia yang mungkin terhambat untuk bisa mencapai lokasinya, ataupun potensi kerumunan yang mungkin terjadi.  Atau, cara lainnya adalah dengan vaksinasi mobile yang langsung (jemput bol), alias vaksinatornya langsung mendatangi masyarakat yang belum mendapat vaksin COVID-19.  Kalau di sekitarmu, apakah ada terobosan pelaksanaan vaksinasi yang bisa ditiru?    Untuk informasi terkait COVID-19 kunjungi situs resmi Penanganan COVID-19 dan Pemulihan Ekonomi Nasional #IndonesiaBangkit #SEMUAWAJIBPAKAIMASKER",
    "pubDate": "Rab, 29 Des 2021",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "judul" : "\"10 Vaksin COVID-19 yang Sudah Dapatkan Izin Penggunaan Darurat dari Badan POM\"",
    "content": "Badan Pengawas Obat dan Makanan Indonesia sudah memberikan izin penggunaan darurat pada 10 jenis vaksin COVID-19, yakni Sinovac, AstraZeneca, Sinopharm, Moderna, Pfizer, Novavax, Sputnik-V, Janssen, Convidencia, dan Zifivax",
    "content_full" : "Badan Pengawas Obat dan Makanan Indonesia sudah memberikan izin penggunaan darurat pada 10 jenis vaksin COVID-19, yakni Sinovac, AstraZeneca, Sinopharm, Moderna, Pfizer, Novavax, Sputnik-V, Janssen, Convidencia, dan Zifivax. Masing-masing dari jenis vaksin ini memiliki mekanisme untuk pemberiannya masing, baik dari jumlah dosis, interval pemberian, hingga platform vaksin yang berbeda-beda, yakni inactivated virus, berbasis RNA, viral-vector, dan sub-unit protein. Vaksin yang disediakan adalah vaksin yang sudah dipastikan keamanan dan efektivitasnya.    Mari segera vaksinasi dan tetap disiplin protokol kesehatan 3M!  Untuk informasi terkait COVID-19 kunjungi situs resmi Penanganan COVID-19 dan Pemulihan Ekonomi Nasional",
    "pubDate": "Sel, 28 Des 2021 ",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "judul" : "\"Total Kasus Terkonfirmasi Omicron Bertambah LAGI Jadi 46 Kasus\"",
    "content": "Badan Litbangkes kembali mengumumkan hasil pemeriksaan pada 25 Desember 2021 dengan 27 kasus baru varian Omicron",
    "content_full" : "Badan Litbangkes kembali mengumumkan hasil pemeriksaan pada 25 Desember 2021 dengan 27 kasus baru varian Omicron.  Keduapuluh tujuh kasus tersebut terdiri dari 26 kasus positif transmisi impor dari Pelaku Perjalanan Luar Negeri, yakni 25 orang WNI yang baru pulang dari Malaysia, Kenya, Uni Emirat Arab, Arab Saudi, Mesir, Malawi, Spanyol, Inggris, Turki, serta 1 orang WNA asal Nigeria, dan 1 kasus positif transmisi lokal, yakni Tenaga Kesehatan di RSDC Wisma Atlet. Total kasus positif varian Omicron yang berhasil terdeteksi di Indonesia capai 46 kasus. Tetap disiplin protokol kesehatan, segerakan mendapat vaksinasi COVID-19, dan patuhi kebijakan yang berlaku demi kebaikan bersama.  Untuk informasi terkait COVID-19 kunjungi situs resmi Penanganan COVID-19 dan Pemulihan Ekonomi Nasional  dan  #IndonesiaBangkit #SEMUAWAJIBPAKAIMASKER",
    "pubDate": "Sen, 27 Des 2021",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "judul" : "\"Upayakan Ketersediaan Fasilitas Karantina di Sekitar Pintu Masuk Negara, Satgas COVID-19 Siapkan 3 Lokasi di Jakarta\"",
    "content": "Untuk memastikan kesiapan fasilitas karantina untuk para Pelaku Perjalanan Luar Negeri (PPLN) yang meningkat, Satgas COVID-19 menyiapkan 3 lokasi karantina baru di Jakarta, yakni Rusun Nagrak Cilincing, Rusun Daan Mogot, dan LPMP DKI Jakarta",
    "content_full" : "Untuk memastikan kesiapan fasilitas karantina untuk para Pelaku Perjalanan Luar Negeri (PPLN) yang meningkat, Satgas COVID-19 menyiapkan 3 lokasi karantina baru di Jakarta, yakni Rusun Nagrak Cilincing, Rusun Daan Mogot, dan LPMP DKI Jakarta.  Ke depannya pemerintah akan terus mengawasi baik angka kapasitas dan ketersediaan karantina sekaligus standar fasilitasnya. Untuk informasi terkait COVID-19 kunjungi situs resmi Penanganan COVID-19 dan Pemulihan Ekonomi Nasional  dan  #IndonesiaBangkit #SEMUAWAJIBPAKAIMASKER",
    "pubDate": "Min, 26 Des 2021",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "judul" : "\"Kasus Positif Ditemukan Paling Banyak di Pintu Masuk Indonesia Jalur Laut\"",
    "content": "Pemerintah mencermati angka positivity rate atau  rata-rata jumlah kasus positif dari jumlah pemeriksaan COVID-19 di pintu kedatangan masuk ke Indonesia melalui transportasi udara, darat dan laut",
    "pubDate": "Pemerintah mencermati angka positivity rate atau  rata-rata jumlah kasus positif dari jumlah pemeriksaan COVID-19 di pintu kedatangan masuk ke Indonesia melalui transportasi udara, darat dan laut.  Hasilnya, per 12-18 Desember 2021 ditemukan angka positivity Rate di pintu masuk Indonesia yang paling tinggi adalah di jalur laut setinggi 5,41%, diikuti jalur darat sebesar 1,3%, dan melalui jalur udara sebanyak 0,48%.  Untuk menyikapi hal ini pemerintah akan semakin memperketat pengawasan di pintu kedatangan di Indonesia, baik yang masuk melalui jalur darat, laut maupun udara.    Patuhi protokol kesehatan dan kebijakan yang berlaku, serta segerakan vaksinasi COVID-19 bagi yang belum.  Untuk informasi terkait COVID-19 kunjungi situs resmi Penanganan COVID-19 dan Pemulihan Ekonomi Nasional  dan  #IndonesiaBangkit #SEMUAWAJIBPAKAIMASKER",
    "pubDate": "Min, 26 Des 2021",
    "image": "assets/images/travlog_yogyakarta.png"
  }
];