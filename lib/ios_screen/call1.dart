import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ch_2/global.dart';
import '../provider/datetimeprovider.dart';

class call1 extends StatefulWidget {
  call1({Key? key}) : super(key: key);

  @override
  State<call1> createState() => _call1State();
}

class _call1State extends State<call1> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: (Contactprovider.allcontact.isNotEmpty)
            ? Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: ListView.builder(
                  itemCount: Contactprovider.allcontact.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CupertinoListTile(
                      leading: CircleAvatar(
                        radius: 80,
                        foregroundImage: FileImage(File(global.pic1!.path)),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "${Contactprovider.allcontact[index].MobileNumber}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 23, 18, 18),
                              fontSize: 25),
                        ),
                      ),
                      trailing: Text(
                          "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}   ${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}"),
                    );
                  },
                ),
              )
            : Center(
                heightFactor: 35,
                child: Text("No any chat yet..."),
              ));
  }
}
