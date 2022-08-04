import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      home: Start(),
    );
  }
}

class Start extends StatefulWidget {
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  TextEditingController lmodir = TextEditingController();

  List tasks = [
    {"text": "buy milk", "checked": false},
    {"text": "buy egg", "checked": false},
    {"text": "buy veg", "checked": false}
  ];
  bool checkval = false;
  @override
  Widget build(BuildContext context) {
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
                    child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          checkval = tasks[index]["checked"];
                          return ListTile(
                              title: Text(tasks[index]["text"],
                                  style: TextStyle(
                                      decoration: checkval
                                          ? TextDecoration.lineThrough
                                          : null)),
                              trailing: Checkbox(
                                  value: checkval,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      tasks[index]["checked"] = value!;
                                    });
                                  }));
                        })),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: Color(0xff757575),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Add Task',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          TextField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            onChanged: (newText) {},
                            controller: lmodir,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 30),
                            child: ButtonTheme(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlueAccent,
                                  fixedSize: const Size(100, 55),
                                  shape: const StadiumBorder(),
                                ),
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    tasks.add({
                                      "text": lmodir.text,
                                      "checked": false
                                    });
                                    lmodir.clear();
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ),
                          )
                        ]),
                  ),
                );
              });
        },
        isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
