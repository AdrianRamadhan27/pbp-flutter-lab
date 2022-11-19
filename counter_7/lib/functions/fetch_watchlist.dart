import 'package:counter_7/models/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchlist>> fetchMyWatchlist() async {
  var url = Uri.parse('https://pbp-assignment-2106750540.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<MyWatchlist> watchList = [];
  for (var d in data) {
    if (d != null) {
      MyWatchlist movie = MyWatchlist.fromJson(d);
      watchList.add(movie);
    }
  }

  return watchList;
}