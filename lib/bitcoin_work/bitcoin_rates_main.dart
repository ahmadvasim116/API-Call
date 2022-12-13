import 'dart:convert';

import 'package:api_call/bitcoin_work/bitcoin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BitcoinMainPage extends StatefulWidget {
  const BitcoinMainPage({super.key});

  @override
  State<BitcoinMainPage> createState() => _BitcoinMainPageState();
}

class _BitcoinMainPageState extends State<BitcoinMainPage> {
  Map? data;
  Future<BitcoinModel> fetchData() async {
    BitcoinModel bm;
    String url = await "https://api.coindesk.com/v1/bpi/currentprice.json";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    bm = BitcoinModel.fromJson(jsonresponse);
    return bm;
    // setState(() {
    //   data = jsonresponse['time'];
    // });
    // print(response.body); /* checked response in body */
    // print(jsonresponse['time']);
    // print(response.statusCode); /* checked linked right or wrong */
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<BitcoinModel>(
            future: fetchData(),
            builder: (context, AsyncSnapshot<BitcoinModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final data = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    /*Mycards("${snapshot.data!.time.updated}"),*/
                    Mycards("${data.time.updated}", Colors.amber),
                    Mycards("${data.disclaimer}",
                        Color.fromARGB(255, 175, 183, 58)),
                    Row(
                      children: [
                        Text(
                          'EURO:',
                          style: TextStyle(color: Colors.red),
                        ),
                        Expanded(
                            child:
                                Mycards("${data.bpi.eur!.rate}", Colors.red)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'USD:',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                        Expanded(
                            child: Mycards(
                                "${data.bpi.usd!.rate}", Colors.greenAccent)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'GBP:',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                            child:
                                Mycards("${data.bpi.gbp!.rate}", Colors.grey)),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  Container Mycards(String text, Color c) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          color: c,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('$text'),
          ),
        ),
      ),
    );
  }
}
