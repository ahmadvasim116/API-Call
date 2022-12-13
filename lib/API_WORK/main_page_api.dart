import 'package:api_call/API_WORK/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MainPageApi extends StatelessWidget {
  // MainPageApi({super.key});
  // var jsondecode;

  Future<Student?> loadAsset() async {
    var loadJson = await rootBundle.loadString('json_data/student_json.json');
    Map<String, dynamic> jsondecode = await json.decode(loadJson);
    Student s = Student.fromJson(jsondecode);
    // print(s.name);
    return s;
  }

  @override
  Widget build(BuildContext context) {
    loadAsset();
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: loadAsset(),
          builder: (context, AsyncSnapshot<Student?> snapshot) {
            final result = snapshot.data!;
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(children: [
              Text('ATTRIBUTES Map Another Data'),
              Card(
                color: Colors.purple,
                child: ListTile(
                  title: Text('${result.attributes.color}'),
                  // title: Text('${result.attributes!.color}'), /* it's possible to add attributes! */
                ),
              ),
              Text('Subjects'),
              ...List.generate(result.subjects.length, (index) {
                return Card(
                  color: Colors.amber,
                  child: ListTile(
                    title: Text('${result.subjects[index]}'),
                  ),
                );
              }),
              Text('Profile'),
              Card(
                color: Colors.amber,
                child: ListTile(
                  title: Text('${result.name}'),
                ),
              ),
              Card(
                color: Colors.amber,
                child: ListTile(
                  title: Text('${result.age}'),
                ),
              ),
              Card(
                color: Colors.amber,
                child: ListTile(
                  title: Text('${result.rollNo}'),
                ),
              ),
            ]);

            // ListTile(
            //   textColor: Colors.red,
            //   title: Text('${snapshot.data!.name}'),
            //   subtitle: Text('${snapshot.data!.age}'),
            //   // leading: Text('${snapshot.data!.rollNo}'),
            // );
          }),
    ));
  }
}


/* this is one way */
// class MainPageApi extends StatelessWidget {
//   // MainPageApi({super.key});
//   // var jsondecode;

//   Future<Student?> loadAsset() async {
//     var loadJson = await rootBundle.loadString('json_data/student_json.json');
//     Map<String, dynamic> jsondecode = await json.decode(loadJson);
//     Student s = Student.fromJson(jsondecode);
//     // print(s.name);
//     return s;
//   }

//   @override
//   Widget build(BuildContext context) {
//     loadAsset();
//     return Scaffold(
//         body: FutureBuilder(
//             future: loadAsset(),
//             builder: (c, AsyncSnapshot<Student?> snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               return Column(children: [
//                 Text('Subjects'),
//                 ...List.generate(snapshot.data!.subjects.length, (index) {
//                   return Card(
//                     color: Colors.amber,
//                     child: ListTile(
//                       title: Text('${snapshot.data!.subjects[index]}'),
//                     ),
//                   );
//                 }),
//                 Text('Profile'),
//                 Card(
//                   color: Colors.amber,
//                   child: ListTile(
//                     title: Text('${snapshot.data!.name}'),
//                   ),
//                 ),
//                 Card(
//                   color: Colors.amber,
//                   child: ListTile(
//                     title: Text('${snapshot.data!.age}'),
//                   ),
//                 ),
//                 Card(
//                   color: Colors.amber,
//                   child: ListTile(
//                     title: Text('${snapshot.data!.rollNo}'),
//                   ),
//                 ),
//               ]);
//               // ListTile(
//               //   textColor: Colors.red,
//               //   title: Text('${snapshot.data!.name}'),
//               //   subtitle: Text('${snapshot.data!.age}'),
//               //   // leading: Text('${snapshot.data!.rollNo}'),
//               // );
//             }));
//   }
// }
