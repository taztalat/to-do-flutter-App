import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var input;
  List<dynamic> lst = [];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("android/assets/images/pic.jpg.jpg"),
              fit: BoxFit.cover),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('To-Do App'),
          backgroundColor: Colors.transparent,
          elevation: 0, // <-- ELEVATION ZEROED
        ),
        body: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.only(top: 15),
                  child: (ListTile(
                    title: Text("${lst[index]}"),
                    trailing: Container(
                      width: 50,
                      height: 200,
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(Icons.edit),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Edit Item"),
                                      content: TextField(
                                        onChanged: (value) {
                                          input = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {input});
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Edit"))
                                      ],
                                    );
                                  });
                            },
                          ),
                          GestureDetector(
                            child: Icon(Icons.delete),
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  )));
            }),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  child: Text("Clear"),
                  onPressed: () {
                    setState(() {
                      lst.clear();
                    });
                  },
                ),
                FloatingActionButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Add item"),
                            content: TextField(
                              onChanged: (value) {
                                input = value;
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      lst.add(input);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Add"))
                            ],
                          );
                        });
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
