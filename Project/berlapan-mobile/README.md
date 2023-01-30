# berlapan-mobile
Repo untuk versi mobile dari aplikasi Berlapan

# Developers
1. Defran Fransisco - 2006596895
2. Gilang Arfadika Hanania - 2006596951
3. Gregorius Farel Prasasta - 2006597185
4. Khairinka Rania Lizadhi - 2006597254
5. Muhammad Rafi Atha Zhafran - 2006597456
6. Salsabila Zahra Chinanti - 2006596762
7. Sania Rizqi Maharani - 2006597001

# Deskripsi Singkat Aplikasi
Berlapan merupakan singkatan dari Bersama Lawan Pandemi.\
Berlapan mobile merupakan versi mobile dari web Berlapan yang dapat diakses di https://berlapan.herokuapp.com/ .\
Dalam aplikasi ini, pengguna dapat mendaftarkan diri sebagai relawan donor darah, relawan vaksin, mendaftarkan diri untuk mendapatkan layanan vaksinasi, mendaftarkan diri untuk mendapatkan layanan tes swab/PCR, serta memperoleh informasi seputar COVID-19 di Indonesia.

# Link Download APK
APK Berlapan Mobile : https://ristek.link/berlapan

# Cerita Daftar Modul dan Integrasi dengan Web Service
Berlapan-mobile memiliki 6 modul : Landing Page, Profile Page, Home Page, Daftar Relawan Vaksin, Daftar Relawan Donor Darah, dan Daftar Vaksinasi.

# Penjelasan Modul Landing Page : Khairinka Rania Lizadhi
Landing Page adalah halaman pertama yang dilihat oleh user Berlapan. Disini, terdapat slider yang menampilkan preview visual dari fitur-fitur yang ditawarkan Berlapan. Di bawah slider ini, terdapat form untuk melakukan sign up. Di bawah form tersebut, ada juga opsi untuk sign in apabila user sudah pernah sign up sebelumnya. Fields dari kedua form tersebut sama, yaitu email address sebagai input pertama, dan char field sebagai input ke-2. Setelah mengetuk CTA di bawah form, user akan diantarkan ke Home Page.

# Penjelasan Modul Profile Page : Defran Fransisco
Profile Page Berlapan merupakan tampilan halaman yang menampilkan profile dari user berlapan. Disini user berlapan hanya seorang relawan. Profile yang akan diambil dari data-data yang diberikan user saat melakukan sign up. 

# Penjelasan Modul Home Page : Muhammad Rafi Atha Zhafran
Home Page Berlapan bertujuan membantu menggambarkan fitur-fitur dari aplikasi pada user tanpa mengharuskan user mengulas aplikasi berlapan terlebih dahulu secara keseluruhan. Page hanya dapat diakses ketika user telah mendaftarkan dirinya. Page ini nantinya juga akan menampilkan profil dari user, seperti username, dan profile picture.  Aplikasi Berlapan juga menyediakan informasi mengenai covid-19 yang mengambil berita dari website lainnya secara aktual dengan tujuan untuk membantu user mencari informasi mengenai covid-19, seperti bahayanya, cara mencegahnya, dan informasi lainnya. Nantinya informasi tersebut akan disediakan secara slider agar lebih mudah mencari informasi.

Berikutnya, page ini juga akan menampilkan kisah perjuangan orang-orang yang telah sembuh dari covid dan kesulitan yang mereka hadapi untuk mencapai kesembuhan. Tujuan dengan adanya kisah ini adalah untuk menggerakan hati user membantu orang-orang yang sedang terdapak covid-19. Kemudian terdapat ringkasan mengenai fitur aplikasi dan tombol yang nantinya meredirect user apabila hatinya tergerak setelah membaca kesulitan orang-orang yang telah sembuh dari covid-19. Home page ini nantinya juga terdapat fitur search pengguna lain yang mana data-datanya diambil dari website Berlapan.

# Penjelasan Modul Daftar Relawan Vaksin : Gilang Arfadika Hanania

Tenaga-tenaga kerja medis di Indonesia sudah banyak berkontribusi dalam menperlambat lajur peningkatan covid-19 di Indonesia. Akan tetapi, tidak dapat dipungkiri bahwa ketersedian tenaga-tenaga kerja tersebut masih sangat terbatas dalam jumlah kuantitasnya. Banyak organisasi masyarakat yang berinisiatif untuk membantu tenaga kerja medis di Indonesia dengan mengajak masyarakat umum untuk menjadi tenaga kerja yang bekerja secara sukarela membantu mengatasi pandemi covid-19 atau lebih mudah dikenal sebagai relawan covid-19. Melihat fenomena tersebut, Berlapan.com terinspirasi untuk melakukan Hal sama seperti yang dilakukan oleh  organisasi-organisasi masyarakat tersebut dengan membuat page untuk pendaftaran menjadi relawan vaksin covid-19. 

Di page ini, para pengguna akan dapat langsung memasukan data-data identitas mereka ke dalam suatu form  yang nantinya akan disimpan di dalam database milik berlapan.com. Setelah mereka berhasil mendaftar, mereka akan diberikan suatu pilihan agar mereka dapat melihat data yang mereka telah masukan atau data pendaftaran relawan vaksin dari  pengguna yang lain. Data-data relawan vaksin yang dapat dilihat oleh para pengguna secara umum dibagi menjadi dua yaitu data relawan vaksin singkat dan data relawan vaksin detail. Data relawan vaksin singkat hanya akan menampilkan data singkat dari para pengguna yang mendaftar menjadi relawan vaksin sedangkan data relawan vaksin detail memberikan data lebih detail lagi dibanding data relawan vaksin singkat. Pada umumnya, Para pengguna yang sudah mendaftar menjadi relawan vaksin diperbolehkan untuk melihat data relawan vaksin singkat tetapi mereka tidak diperbolehkan untuk melihat data relawan vaksin detail karena tipe data tersebut hanya dapat dilihat ketika para pengguna sudah melakukan login terlebih dahulu ke Berlapan.com.   

# Penjelasan Modul Daftar Relawan Donor Darah : Salsabila Zahra Chinanti
Pada masa pandemi, kebutuhan akan donor darah tentunya meningkat. Terkadang, masyarakat yang membutuhkan donor darah kesulitan untuk mencari relawan. Oleh karena itu, Berlapan menyediakan fitur daftar relawan donor darah untuk membantu masyarakat yang membutuhkan dan menyediakan informasi institusi terpercaya bagi masyarakat yang ingin mendonorkan darahnya.

Fitur relawan donor darah berisi informasi yang diperlukan para relawan untuk mendonorkan darahnya. Pada saat fitur diklik, terdapat opsi mendaftarkan diri sebagai relawan donor darah dan rekomendasi tempat donor darah. Saat mendaftarkan diri sebagai relawan donor darah, pengguna harus mengisi formulir terlebih dahulu yang berisi nama lengkap, tanggal lahir, nomor induk kependudukan (NIK), golongan darah, sentra layanan golongan darah, tanggal donor darah, dan waktu donor darah. Apabila pengguna memenuhi persyaratan dan mengisi form dengan valid, pengguna telah terdaftar menjadi relawan donor darah dan dapat mendonorkan darahnya di tempat yang dipilih pada waktu yang telah ditentukan.

Modul Donor Darah pada aplikasi Berlapan juga terdapat di aplikasi web Berlapan. Untuk itu, diperlukan integrasi data dari web aplikasi Berlapan ke aplikasi Berlapan. Data yang akan diintegrasikan dari modul donor darah adalah data formulir pendaftaran relawan donor darah. Pengintegrasian data dilakukan dengan mengirim data dari basis data Django ke framework Flutter.

# Penjelasan Modul Daftar Vaksinasi : Gregorius Farel Prasasta
Dalam modul ini, user bisa mendaftarkan diri untuk mendapatkan vaksinasi. Pertama, modul ini akan memunculkan halaman yang berisi alasan-alasan perlunya vaksinasi. Halaman ini memiliki tombol “Ayo daftar vaksinasi sekarang” yang jika ditekan, akan memunculkan form “Form Pendaftaran Vaksinasi”.

Dalam “Form Pendaftaran Vaksinasi”, user perlu mengisi field “Nama”, “Tanggal Lahir”, “NIK”, “Alamat Sentra Vaksinasi”, “Tanggal Vaksinasi”, “Jam Vaksinasi”, dan “Vaksinasi Ke-” . Field “Alamat Sentra Vaksinasi”, “Tanggal Vaksinasi”, dan “Jam Vaksinasi” akan berbentuk dropdown yang menampilkan data-data yang sudah dibuat dalam models.py Django. “Vaksinasi Ke-” akan berbentuk dropdown untuk memilih “1” atau “2”. Jika semua field terisi dan user menekan tombol “Daftar”, akan dibuat instance dari model “PesertaVaksinasi” pada database Django. Jika user menekan tombol “Klik Setelah Daftar”, aplikasi akan kembali ke home.




