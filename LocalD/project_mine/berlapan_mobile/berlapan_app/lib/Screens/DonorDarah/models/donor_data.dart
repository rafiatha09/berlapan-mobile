class DonorData {
  final String id;
  final String nama;
  final String nik;
  final String tglLahir;
  final String goldar;
  final String sentra;
  final String waktuDonor;

  DonorData(
      {required this.id,
      required this.nama,
      required this.nik,
      required this.tglLahir,
      required this.goldar,
      required this.sentra,
      required this.waktuDonor});

  factory DonorData.fromJson(Map<String, dynamic> json) {
    return DonorData(
      id: json['id'],
      nama: json['FullName'],
      nik: json['NIK'],
      tglLahir: json['BirthDate'],
      goldar: json['Goldar'],
      sentra: json['Sentra'],
      waktuDonor: json['Date'] + " " + json['Time'],
    );
  }
  dynamic toJson() => {
      'id' : id,
      'FullName' : nama,
      'NIK' : nik,
      'BirthDate' : tglLahir,
      'Goldar' : goldar,
      'Sentra' : sentra,
      'Date' : waktuDonor.split(" ")[0],
      'Time' : waktuDonor.split(" ")[1]
      };
}