import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/componants.dart';
import 'package:todo/services/manager.dart';
import 'package:todo/services/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(), child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:Start() ,
    ));
    
  }
}

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  TextEditingController lmodir = TextEditingController();

  bool checkval = false;
  // i will add firebase firestore to this  in this upcoming das
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskProvider>(context).GetTasks;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 182, 249),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                padding: EdgeInsets.all(15),
                child:
                    Icon(Icons.list, size: 30, color: Colors.lightBlueAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "ToDoey\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                      text: "${tasks.length} Task",
                      style: TextStyle(
                          color: Color(0xffACECFF),
                          fontWeight: FontWeight.w600))
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 40, 30, 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: TaskList(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTaskScreen(context);
        },
        isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
