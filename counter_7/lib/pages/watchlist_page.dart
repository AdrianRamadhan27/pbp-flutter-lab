
import 'package:flutter/material.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/widgets/my_drawer_.dart';
import 'package:counter_7/pages/watchlist_detail_page.dart';
import 'package:counter_7/models/mywatchlist.dart';
import 'package:flutter/services.dart';

import 'package:counter_7/functions/fetch_watchlist.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  late Future<List<MyWatchlist>> futureMyWatchlist;
  List<bool> statusList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMyWatchlist = fetchMyWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Watchlist'),
      ),
      drawer: const MyDrawer(),
      body:  FutureBuilder(
          future: futureMyWatchlist,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              for (int i = 0; i < snapshot.data!.length; i++) {
                statusList.add(snapshot.data![i].fields.watched);
              }
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watch list :(",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: (statusList[index])?Colors.blue:Colors.red,
                            width: 3.0
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    WatchlistDetailPage(
                                      watchlistData: snapshot.data![index],
                                      watched: statusList[index]
                                    )
                                ),
                              );
                            },

                          ),
                          Checkbox(
                              value: statusList[index],
                              onChanged: (value) {
                                setState(() {
                                  statusList[index] = value!;
                                });
                              }
                          )
                        ],
                      ),
                    )
                );
              }
            }
          }
      ),
    );
  }
}