import 'package:counter_7/models/mywatchlist.dart';
import 'package:flutter/material.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/widgets/my_drawer_.dart';
import 'package:counter_7/models/budget.dart';
import 'package:flutter/services.dart';



class WatchlistDetailPage extends StatelessWidget {
  final MyWatchlist watchlistData;
  final bool watched;

  const WatchlistDetailPage({
    super.key,
    required this.watchlistData,
    required this.watched
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      drawer: const MyDrawer(),
      body:  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                watchlistData.fields.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Row(
              children: [
                const Text(
                    "Release Date: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                    watchlistData.fields.releaseDate.toString().substring(0, 10)
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                    "Rating: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                    watchlistData.fields.rating.toString()
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                    "Status: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                    (watched) ? "watched":"not watched"
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                    "Review: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                    watchlistData.fields.review
                ),
              ],
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back"
                  )),
            )
          ],
        )
      ),
    );
  }
}