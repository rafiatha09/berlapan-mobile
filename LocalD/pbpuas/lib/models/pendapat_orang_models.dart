class OrangKuat{
  late String name;
  late String country;
  late String image;

  OrangKuat(this.name, this.country, this.image);
}

List<OrangKuat> populars = OrangData.map((item) => OrangKuat(item['name'].toString(),item['country'].toString(),item['image'].toString())).toList();

var OrangData = [
  {"name": "Bali", "country":"Jakarta", "image": "assets/images/orang_pertama.png"},
  {"name": "Paris", "country":"Bandung", "image": "assets/images/orang_kedua.png"},
  {"name": "Rome", "country":"Banten", "image": "assets/images/orang_ketiga.png"},
];