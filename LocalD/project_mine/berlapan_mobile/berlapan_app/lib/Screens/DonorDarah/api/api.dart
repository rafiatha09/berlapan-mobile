import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/donor_data.dart';
import 'package:http/http.dart' as http;

class DonorDataProvider with ChangeNotifier {
  DonorDataProvider() {
    this.fetchTasks();
  }

  List<DonorData> _donordata = [];

  List<DonorData> get donordata {
    return [..._donordata];
  }

  void addData(DonorData donorData) async {
    final response = await http.post(
        Uri.parse('http://berlapan.herokuapp.com/apis/v1/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(donorData));
    if (response.statusCode == 201) {
      _donordata.add(donorData);
      notifyListeners();
    }
  }

  fetchTasks() async {
    const url = 'https://61cd861c7067f600179c5ae6.mockapi.io/api/v1/donors';
    final response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _donordata =
          data.map<DonorData>((json) => DonorData.fromJson(json)).toList();
      notifyListeners();
    }
    print(_donordata);
  }
}
