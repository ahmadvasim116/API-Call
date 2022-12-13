import 'dart:convert';
import 'package:api_call/API_WORK/cricket_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:api_call/API_WORK/cricket_page.dart';

class CricketPage extends StatelessWidget {
  // const CricketPage({super.key});
  Future<CricketModel?> loadCricketData() async {
    var loadAsset = await rootBundle.loadString('json_data/cricket.json');
    var loadJson = await json.decode(loadAsset);
    // print(loadJson);
    var c = CricketModel.fromJson(loadJson);
    return c;
  }

  @override
  Widget build(BuildContext context) {
    loadCricketData();
    return Scaffold(
      body: FutureBuilder(
          future: loadCricketData(),
          builder: (c, AsyncSnapshot<CricketModel?> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            // or data recieved from internet so use this
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Center(
              child: Column(
                children: [
                  Card(
                    child: Text('${snapshot.data!.format}'),
                  ),
                  Card(
                    child: Text('${snapshot.data!.playername}'),
                  ),
                  Card(
                    child: Text('${snapshot.data!.age}'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
