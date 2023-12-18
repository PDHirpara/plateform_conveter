// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:ch_2/provider/datetimeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ch_2/global.dart';
import 'package:provider/provider.dart';

import '../modal/profile_variable_model.dart';

class man extends StatefulWidget {
  man({Key? key}) : super(key: key);

  @override
  State<man> createState() => _manState();
}

class _manState extends State<man> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () async {
                final XFile? image =
                    await global.picker1.pickImage(source: ImageSource.camera);
                setState(() {
                  global.pic1 = image;
                  
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: Stack(
                  children: [
                    if (global.pic1 == null)
                      Icon(
                        Icons.add_a_photo_outlined,
                        color: const Color.fromARGB(255, 80, 75, 81),
                        size: 30,
                      )
                    else
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: FileImage(File(global.pic1!.path)),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: TextFormField(
              controller: global.namecontroller,
              onSaved: (val) {
                global.name = val;
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: global.mobilenumbercontroller,
              onSaved: (val) {
                global.mobilenumber = val;
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
            child: TextFormField(
              controller: global.emailcontroller,
              onSaved: (val) {
                global.email = val;
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.chat,
                    color: Colors.black,
                  ),
                  hintText: "Chat Conversation",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          GestureDetector(
              onTap: () async {
                DateTime? Pickedate = await showDatePicker(
                  context: context,
                  initialDate:
                      Provider.of<datetimeprovider>(context, listen: false)
                          .dateTimeModel
                          .initialdate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050),
                );
                Provider.of<datetimeprovider>(context, listen: false)
                    .pickdate(Pickedate!);
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Pick a date       "),
                    ),
                    Text(
                        "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}")
                  ],
                ),
              )),
          GestureDetector(
              onTap: () async {
                TimeOfDay? Picketime = await showTimePicker(
                    context: context,
                    initialTime:
                        Provider.of<datetimeprovider>(context, listen: false)
                            .Timemodal
                            .initialtime);
                Provider.of<datetimeprovider>(context, listen: false)
                    .picktime(Picketime!);
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Icon(Icons.watch),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Pick a time       "),
                    ),
                    Text(
                        "${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}")
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Provider.of<Contactprovider>(context, listen: false).add_contact(
                Contact(
                  Firstname: global.namecontroller.text,
                  MobileNumber: global.mobilenumbercontroller.text,
                  Email: global.emailcontroller.text,
                ),
              );
            },
            child: Text("save"),
          )
        ],
      ),
    );
  }
}
