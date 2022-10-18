class AddStudent {
  String FirstName;
  String LastName;
  String Mobile;
  String Email;
  String NationalID;
  int Age;
  AddStudent({
    required this.Age,
    required this.NationalID,
    required this.Email,
    required this.FirstName,
    required this.LastName,
    required this.Mobile,
  });
}

class Student {
  int ID;
  String Name;
  String Mobile;
  String Email;
  String NationalID;
  int Age;
  Student({
    required this.ID,
    required this.Age,
    required this.NationalID,
    required this.Email,
    required this.Name,
    required this.Mobile,
  });
}
