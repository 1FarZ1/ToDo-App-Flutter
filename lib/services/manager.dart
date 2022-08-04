import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/services/provider.dart';

Future AddTaskScreen(BuildContext context) {
  TextEditingController lmodir = TextEditingController();
  return showModalBottomSheet(
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
                          var mybeutifualprovider =
                              Provider.of<TaskProvider>(context, listen: false);
                          mybeutifualprovider.AddTask(lmodir.text);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ]),
          ),
        );
      });
}
