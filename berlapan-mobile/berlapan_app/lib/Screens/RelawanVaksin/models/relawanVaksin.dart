// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'package:http/http.dart' as http;
class relawanVaksin {
  late String nama;
  late int umur;
  late int nomorKtp;
  late int nomorHp;
  late String email;
  late String alamat;
  late String peran;
  late String riwayatNakes;
  late String foto;

  relawanVaksin(
      {required this.nama,
      required this.umur,
      required this.nomorKtp,
      required this.nomorHp,
      required this.email,
      required this.alamat,
      required this.peran,
      required this.riwayatNakes,
      required this.foto});

  relawanVaksin.fromJson(Map<String, dynamic> json) {
    nama = json['Nama'] as String;
    umur = json['umur'] as int;
    nomorKtp = json['nomor_ktp'] as int;
    nomorHp = json['nomor_hp'] as int;
    email = json['email'] as String;
    alamat = json['alamat'] as String;
    peran = json['Peran'] as String;
    riwayatNakes = json['Riwayat_nakes'] as String;
    foto = json['foto'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nama'] = this.nama;
    data['umur'] = this.umur;
    data['nomor_ktp'] = this.nomorKtp;
    data['nomor_hp'] = this.nomorHp;
    data['email'] = this.email;
    data['alamat'] = this.alamat;
    data['Peran'] = this.peran;
    data['Riwayat_nakes'] = this.riwayatNakes;
    data['foto'] = this.foto;
    return data;
  }
}


//  Nama = models.CharField('Nama Lengkap', max_length=30)
//     umur = models.IntegerField('Umur',)
//     nomor_hp =  models.IntegerField('Nomor Hp')
//     nomor_ktp = models.IntegerField('Nomor Ktp')
//     email = models.EmailField(max_length=30)

//     foto = models.ImageField(upload_to='images/', blank=True)

//     alamat = models.TextField('Alamat domisili')

    
//     Riwayat_nakes = models.CharField('Apakah Anda Seorang Nakes?',choices= Pilihan_nakes
//     , max_length=30)
    
//     Peran = models.CharField('Apa peran yang Anda ingin