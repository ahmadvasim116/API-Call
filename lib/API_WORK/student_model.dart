/* this is the third way of showing multiple data */
// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.name,
    required this.age,
    required this.rollNo,
    required this.subjects,
    required this.attributes,
  });

  String name;
  int age;
  int rollNo;
  List<String> subjects;
  Attributes attributes;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json["name"],
        age: json["age"],
        rollNo: json["rollNo"],
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "rollNo": rollNo,
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.height,
    required this.color,
  });

  double height;
  String color;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        height: json["height"].toDouble(),
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "color": color,
      };
}





/* this is the second way of multiple show data */
// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

// import 'dart:convert';

// Student studentFromJson(String str) => Student.fromJson(json.decode(str));

// String studentToJson(Student data) => json.encode(data.toJson());

// class Student {
//   Student({
//     required this.name,
//     required this.age,
//     required this.rollNo,
//     required this.subjects,
//   });

//   String name;
//   int age;
//   int rollNo;
//   List<String> subjects;

//   factory Student.fromJson(Map<String, dynamic> json) => Student(
//         name: json["name"],
//         age: json["age"],
//         rollNo: json["rollNo"],
//         subjects: List<String>.from(json["subjects"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "age": age,
//         "rollNo": rollNo,
//         "subjects": List<dynamic>.from(subjects.map((x) => x)),
//       };
// }



/* this model create by me easy to write  */
// class Student {
//   String? name;
//   int? age;
//   int? rollNo;
//   Student({this.name, this.age, this.rollNo});

//   factory Student.fromJson(Map<String, dynamic> parsedJson) {
//     return Student(
//       name: parsedJson['name'],
//       age: parsedJson['age'],
//       rollNo: parsedJson['rollNo'],
//     );
//   }
// }





/* this is the create model online Json to Dart Formate Frist Step */
// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

// import 'dart:convert';

// Student studentFromJson(String str) => Student.fromJson(json.decode(str));

// String studentToJson(Student data) => json.encode(data.toJson());

// class Student {
//   Student({
//     required this.name,
//     required this.age,
//     required this.rollNo,
//   });

//   String name;
//   int age;
//   int rollNo;

//   factory Student.fromJson(Map<String, dynamic> json) => Student(
//         name: json["name"],
//         age: json["age"],
//         rollNo: json["rollNo"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "age": age,
//         "rollNo": rollNo,
//       };
// }
