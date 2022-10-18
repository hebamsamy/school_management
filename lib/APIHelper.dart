import 'package:http/http.dart';
import 'dart:convert';

import 'package:school_management/models.dart';

class APIHelper {
  saveStudent(AddStudent std) async {
    var url = Uri.https("api.mohamed-sadek.com", "/Student/POST");
    var res = await post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, Object>{
          "FirstName": std.FirstName,
          "LastName": std.LastName,
          "Mobile": std.Mobile,
          "Email": std.Email,
          "NationalID": std.NationalID,
          "Age": std.Age
        }));
    var data = jsonDecode(res.body);
    print(data);
  }

  Future<bool> DeleteStudent(int id) async {
    print(id);
    //https://api.mohamed-sadek.com/Student/Delete?id=609
    var url = Uri.https(
        "api.mohamed-sadek.com", "/Student/Delete", {'id': id.toString()});
    var res = await delete(url);
    print(res.statusCode);
    print(res.body);
    return jsonDecode(res.body)["Success"] as bool;
  }

  Future<List<Student>> getaAllStudent() async {
    //https://api.mohamed-sadek.com/Student/Get
    var url = Uri.https("api.mohamed-sadek.com", "/Student/Get");
    var res = await get(url);
    var data = jsonDecode(res.body)['Data'] as List;
    List<Student> list = data
        .map((item) => Student(
            ID: item["ID"],
            Age: item["Age"],
            NationalID: item["NationalID"],
            Email: item['Email'],
            Name: item["Name"],
            Mobile: item['Mobile']))
        .toList();
    // print(list[0].Age);
    return list;
    // get(url).then((Response) {
    //   print(Response.statusCode);
    //   print(Response.body);
    // })
  }
}
