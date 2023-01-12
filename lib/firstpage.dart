import 'package:flutter/material.dart';
import 'package:lab_05/secondpage.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _Height = TextEditingController();
  String? sex;
  bool _banana = false;
  bool _orange = false;
  bool _watermelon = false;
  double? _result;

  List<ListItem> _dropdownItems = [
    ListItem(1, 'วิทยาศาสตร์'),
    ListItem(2, 'นิติศาสตร์'),
    ListItem(3, 'ศึกษาศาสตร์'),
    ListItem(4, 'วิทยาการสุขภาพและการกีฬา'),
    ListItem(5, 'อุตสาหกรรมเกษตรและชีวภาพ'),
    ListItem(6, 'พยาบาลศาสตร์'),
    ListItem(7, 'วิศวกรรมศาสตร์'),
    ListItem(8, 'เทคโนโลยีและการพัฒนาชุมชน'),
  ];
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> dropdownItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in dropdownItems) {
      items.add(DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ));
    }
    return items;
  }

  ListItem? _selectedItem;

  @override
  void initState() {
    super.initState();

    _dropdownMenuItems = buildDropdownMenuItem(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firstpage")),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixText: "Kg",
                labelText: "Weight",
              ),
              controller: _weight,
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixText: "Cm",
                labelText: "Height",
              ),
              controller: _Height,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Text("Sex"),
            RadioListTile(
              title: Text("Male"),
              value: "Male",
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  sex = value;
                });
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: "Female",
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  sex = value;
                });
              },
            ),
            RadioListTile(
              title: Text("Others"),
              value: "Others",
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  sex = value;
                });
              },
            ),
            Text("Fruits"),
            CheckboxListTile(
              title: Text("Banana"),
              value: _banana,
              onChanged: (value) {
                setState(() {
                  _banana = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Orange"),
              value: _orange,
              onChanged: (value) {
                setState(() {
                  _orange = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Watermelon"),
              value: _watermelon,
              onChanged: (value) {
                setState(() {
                  _watermelon = value!;
                });
              },
            ),
            Text("Faculty"),
            DropdownButton(
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
            Text('Your Bmi  : ${_result}'),
            ElevatedButton(
              child: Text('cal'),
              onPressed: calculateBMI,
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_Height.text) / 100;
    double weight = double.parse(_weight.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;

    setState(() {});
  }
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}
