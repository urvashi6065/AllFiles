import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pageviewandbottomnavigationbaradvance/Model_Class.dart';
import 'package:pageviewandbottomnavigationbaradvance/main.dart';

class Add_Contact extends StatefulWidget {
  const Add_Contact({Key? key}) : super(key: key);

  @override
  State<Add_Contact> createState() => _Add_ContactState();
}

class _Add_ContactState extends State<Add_Contact> {
  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  File? image;
  getImage() async {
    var pickImage=await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickImage!=null){
      setState(() {
        image=File(pickImage!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: (){
                    getImage();
                  },
                  child: CircleAvatar(radius: 80,child: Icon(CupertinoIcons.camera),)),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
                controller: nameController,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Number",
                ),
                controller: numberController,
              ),
              SizedBox(height: 10,),
              OutlinedButton(onPressed: (){
                modelclass contact =modelclass(image: image, name: nameController.text, number: numberController.text);
                contactList.add(contact);
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'title')), (route) => false);
              }, child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
