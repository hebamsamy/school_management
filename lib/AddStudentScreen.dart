import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:school_management/APIHelper.dart';
import 'package:school_management/models.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

// "FirstName": "string",
//   "LastName": "string",
//   "Mobile": "string",
//   "Email": "string",
//   "NationalID": "string",
//   "Age": 0
class _AddStudentScreenState extends State<AddStudentScreen> {
  // List<String> levels = ['Leval 1', 'Leval 2', 'Leval 3', 'Leval 4'];
  // String SelectedLevel = 'Leval 1';
  var api = APIHelper();
  var Std = AddStudent(
      Age: 18,
      NationalID: "1111111111",
      Email: "asd@asd.com",
      FirstName: "asd",
      LastName: "asd",
      Mobile: "222222222");
  @override
  void initState() {
    // api.saveStudent(Std);
  }

  var form = GlobalKey<FormState>();
  SaveForm() async {
    if (form.currentState!.validate()) {
      form.currentState?.save();
      await api.saveStudent(Std);
      // print(Std.Age);
      // print(Std.FirstName);
      // print(Std.LastName);
      // print(Std.NationalID);
      // print(Std.Email);
      // print(Std.Mobile);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                form.currentState?.reset();
              },
              icon: Icon(Icons.replay))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
            key: form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("First Name"), icon: Icon(Icons.abc)),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "must enter Frist name ";
                    }
                    if (value.length < 3) {
                      return "Frist name must have atleast 3 letters";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      Std.FirstName = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Last Name"), icon: Icon(Icons.abc)),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "must enter Last name ";
                    }
                    if (value.length < 3) {
                      return "Last name must have atleast 3 letters";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      Std.LastName = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Age"), icon: Icon(Icons.numbers)),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "must enter an age ";
                    }
                    if (int.parse(value) < 18) {
                      return "only above 18";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      Std.Age = int.parse(newValue!);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Mobile"), icon: Icon(Icons.phone)),
                  keyboardType: TextInputType.name,
                  onSaved: (newValue) {
                    setState(() {
                      Std.Mobile = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Email"), icon: Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) {
                    setState(() {
                      Std.Email = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("National ID"), icon: Icon(Icons.add_card)),
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {
                    setState(() {
                      Std.NationalID = newValue!;
                    });
                  },
                ),
                // DropdownButton(
                //     value: SelectedLevel,
                //     items: levels
                //         .map((e) => DropdownMenuItem(
                //               child: Text(e),
                //               value: e,
                //             ))
                //         .toList(),
                //     onChanged: (value) {
                //       setState(() {
                //         SelectedLevel = value!;
                //       });
                //       print(SelectedLevel);
                //     })
                ElevatedButton(onPressed: SaveForm, child: Text("Save"))
              ],
            )),
      ),
    );
  }
}
