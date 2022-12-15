import 'package:flutter/material.dart';
import 'package:flutterlab2/cirriculum.dart';

class TimetablePage extends StatelessWidget {
  final String? group;

  const TimetablePage(this.group, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, Map> curriculumPerGroup = scheduled;

    var groupMap = curriculumPerGroup[group];
    var groupEntriesLength = groupMap?.keys.length;
    var groupKeys = groupMap?.keys.toList();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome page'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: groupEntriesLength,
                  itemBuilder: (context, index) {
                    var dayCurriculum =
                        groupMap?[groupKeys?[index]] as Map<int, String>;

                    return Column(children: [
                      Text("${groupKeys?[index]}\n"),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: dayCurriculum.keys.length,
                        itemBuilder: (context, index) {
                          var key = dayCurriculum.keys.toList()[index];
                          var value = dayCurriculum[key];

                          return Container(
                            height: 75,
                            margin: const EdgeInsets.all(10),
                            color: Colors.green,
                            child: Center(child: Text("$key: $value")),
                          );
                        },
                      ),
                    ]);
                  })
            ],
          ),
        ));
  }
}
