import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'enterMarksPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final electiveController = TextEditingController();
  final subjectsController = TextEditingController();

  void dispose() {
    // electiveController.dispose();
    subjectsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 80.0, 0.0, 0.0),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 130.0, 0.0, 0.0),
                  child: Text(
                    'SGPA',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(150.0, 130.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 35.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                TextField(
                  controller: subjectsController,
                  decoration: InputDecoration(
                    labelText: 'Number Of Subjects',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // TextField(
                //   controller: electiveController,
                //   decoration: InputDecoration(
                //     labelText: 'Number of elective subjects',
                //     labelStyle: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),
                SizedBox(height: 80),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => enterMarksPage(
                            subjects: subjectsController.text,
                            // elective_subjects: electiveController.text,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'next',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
