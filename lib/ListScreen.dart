import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:school_management/APIHelper.dart';
import 'package:school_management/models.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() {
    return ListScreenState();
  }
}

class ListScreenState extends State<ListScreen> {
  APIHelper api = APIHelper();
  List<Student> Students = [];

  fetchData() async {
    var temp = await api.getaAllStudent();
    setState(() {
      Students = temp;
    });
    // print(temp);
  }

  @override
  void initState() {
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students count ${Students.length}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/add");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: (Students.isEmpty)
          ? Center(child: Text("Loading........"))
          : ListView.builder(
              itemCount: Students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Students[index].Name),
                  subtitle: Text(Students[index].Email),
                  trailing: Container(
                    width: 150,
                    child: Row(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/edit",
                              arguments: {"id": Students[index].ID});
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Delete(Students[index].ID, context);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/details",
                              arguments: {"id": Students[index].ID});
                        },
                        icon: Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                );
              }),
    );
  }

  void Delete(int id, BuildContext ctx) async {
    var isSuccess = await api.DeleteStudent(id);

    fetchData();
  }
}
