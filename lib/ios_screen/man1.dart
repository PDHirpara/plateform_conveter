import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ch_2/global.dart';
import '../modal/profile_variable_model.dart';
import '../provider/datetimeprovider.dart';
import '../provider/themeprovider.dart';

class man1 extends StatefulWidget {
  man1({Key? key}) : super(key: key);

  @override
  State<man1> createState() => _man1State();
}

class _man1State extends State<man1> {
  GlobalKey formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? image = await global.picker1
                      .pickImage(source: ImageSource.camera);
                  setState(() {
                    global.pic1 = image;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50,
                    child: Stack(
                      children: [
                        if (global.pic1 == null)
                          const Icon(
                            Icons.add_a_photo_outlined,
                            color: Color.fromARGB(255, 80, 75, 81),
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
              const SizedBox(
                height: 20,
              ),
              Transform.scale(
                scale: 1.08,
                child: CupertinoTextFormFieldRow(
                  controller: global.namecontroller,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  placeholder: "Full Name",
                  prefix: const Icon(
                    CupertinoIcons.person,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Transform.scale(
                scale: 1.08,
                child: CupertinoTextFormFieldRow(
                  maxLength: 10,
                  controller: global.mobilenumbercontroller,
                  keyboardType: TextInputType.number,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  placeholder: "Phone Number",
                  prefix: const Icon(
                    CupertinoIcons.phone,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Transform.scale(
                scale: 1.08,
                child: CupertinoTextFormFieldRow(
                  controller: global.emailcontroller,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  placeholder: "Chat Conversation",
                  prefix: const Icon(
                    CupertinoIcons.chat_bubble_text,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {});
                  DateTime? Pickedate = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 350,
                      color: CupertinoColors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        minimumYear: 2000,
                        maximumYear: 2100,
                        onDateTimeChanged: (val) {
                          Provider.of<datetimeprovider>(context, listen: false)
                              .dateTimeModel
                              .initialdate = val;
                        },
                      ),
                    ),
                  );
                  Provider.of<datetimeprovider>(context, listen: false)
                      .pickdate(Pickedate!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(CupertinoIcons.calendar),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.year}",
                      style: TextStyle(
                        color:
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? Picketime = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 350,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now(),
                        minimumYear: 2000,
                        maximumYear: 2100,
                        onDateTimeChanged: (val) {
                          Provider.of<datetimeprovider>(context, listen: false)
                              .Timemodal
                              .initialtime;
                        },
                      ),
                    ),
                  );
                  Provider.of<datetimeprovider>(context, listen: false)
                      .picktime(Picketime!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(CupertinoIcons.time),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}",
                      style: TextStyle(
                        color:
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  Provider.of<Contactprovider>(context, listen: false)
                      .add_contact(
                    Contact(
                      Firstname: global.namecontroller.text,
                      MobileNumber: global.mobilenumbercontroller.text,
                      Email: global.emailcontroller.text,
                    ),
                  );
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
