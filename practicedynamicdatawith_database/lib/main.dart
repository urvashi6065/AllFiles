import 'package:flutter/material.dart';
import 'package:practicedynamicdatawith_database/DatabaseRepo/Database.dart';

import 'StudentModel/ModelClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StudentModelClass> studentList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController idController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    getRefreshData();
    super.initState();
  }

  getRefreshData() {
    DataBaseRepo.getData().then((value) {
      setState(() {
        studentList = value;
      });
    });
  }
  StudentModelClass? object;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Data with Database'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
                suffixIcon:  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.search)),
              ),
              controller: nameController,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Course",
                suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.search),)
              ),
              controller: courseController,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Id",
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    DataBaseRepo.searchingData(int.parse(idController.text)).then((value) {
                      setState(() {
                        object =value;
                      });
                    });
                  });
                },icon: Icon(Icons.search),)
              ),

              controller: idController,
            ),
            Container(
              height: 3000,
              width: double.infinity,
              child: (object==null)?ListView.builder(
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(studentList[index].id.toString()),
                      title: Text(studentList[index].name),
                      subtitle: Text(studentList[index].course),
                      trailing: Container(
                        height: 100,
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    DataBaseRepo.updateData(
                                        nameController.text,
                                        courseController.text,
                                        studentList[index].id);
                                    getRefreshData();
                                  });
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    DataBaseRepo.deleteData(
                                        studentList[index].id);
                                    getRefreshData();
                                  });
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  }):ListTile(
                leading: Text(object!.id.toString()),
                title: Text(object!.name),
                subtitle: Text(object!.course),
                trailing: Container(
                  height: 100,
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              DataBaseRepo.updateData(
                                  nameController.text,
                                  courseController.text,
                                  int.parse(object!.id.toString()));
                              getRefreshData();
                            });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              DataBaseRepo.deleteData(
                                  int.parse(object!.id.toString()));
                              getRefreshData();
                            });
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DataBaseRepo.insertData(nameController.text, courseController.text);
          getRefreshData();
          print(nameController.text);
          print(courseController.text);
          nameController.clear();
          courseController.clear();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
