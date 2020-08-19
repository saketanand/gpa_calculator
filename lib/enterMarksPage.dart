import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'dsiplaySgpa.dart'

class enterMarksPage extends StatelessWidget {
  String subjects;

  int sum = 0;
  // String elective_subjects;

  List<TextEditingController> textEditingController = new List();

  controllerGenerator(int subjects) {
    for (var i = 0; i < subjects; i++) {
      textEditingController.add(new TextEditingController());
    }
  }

  enterMarksPage({String subjects}) {
    this.subjects = subjects;
    // this.elective_subjects = elective_subjects;
  }

  Widget textFieldGenerator(int subject_number) {
    controllerGenerator(int.parse(subjects));
    return Container(
      child: Column(
        children: [
          for (var i = 0; i < subject_number; i++)
            TextField(
              controller: textEditingController[i],
              decoration: InputDecoration(
                labelText: 'Subject ${i + 1}',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Hello',
                        style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 180.0, 0.0, 0.0),
                      child: Text(
                        'There',
                        style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(235.0, 180.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: textFieldGenerator(int.parse(subjects)),
              ),
              SizedBox(height: 30),
            ],
          ),
          Column(
            children: [
              Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.grey,
                        offset: Offset(0.0, 3.0),
                      )
                    ]),
                child: GestureDetector(
                  onTap: () {
                    for (var i = 0; i < int.parse(subjects); i++) {
                      sum += int.parse(textEditingController[i].text);
                    }
                    print(sum);
                    Alert(
                      context: context,
                      title: "Your SGPA",
                      desc: sum.toString(),
                    ).show();
                    sum = 0;
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => displaySgpa(),
                    //   ),
                    // );
                  },
                  child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 50),
                    // color: Colors.black12,
                    // decoration: BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'calculate',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        // SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
