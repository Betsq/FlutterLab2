import 'package:flutter/material.dart';
import 'package:flutterlab2/timetablePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  static const groups = ["КБ-41", "КБ-42", "КБ-43", "КБ-44"];
  String group = groups.first;

  final inputFirstName = TextEditingController();
  final inputSecodmName = TextEditingController();
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"), centerTitle: true),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: DropdownButton<String>(
                isExpanded: true,
                onChanged: (String? changedValue) {
                  group = changedValue!;
                  setState(() {
                    group;
                  });
                },
                value: group,
                items: groups.map((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              )),
          Container(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimetablePage(group)));
              },
              color: Colors.orange,
              child: const Text('Find timetable'),
            ),
          )
        ],
      )),
    );
  }
}
