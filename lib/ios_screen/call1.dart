import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ch_2/global.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/datetimeprovider.dart';
import '../provider/themeprovider.dart';

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
              padding: const EdgeInsets.only(top: 18.0),
              child: ListView.builder(
                itemCount: Contactprovider.allcontact.length,
                itemBuilder: (BuildContext context, int index) {
                  return CupertinoListTile(
                    onTap: () {
                      launchUrl(
                        Uri(
                          scheme: 'tel',
                          path:
                              "+91 ${Contactprovider.allcontact[index].MobileNumber}",
                        ),
                      );
                    },
                    leading: (global.pic1 == null)
                        ? Icon(
                            Icons.add_a_photo_outlined,
                            color: (Provider.of<themeprovider>(context,
                                            listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                            size: 30,
                          )
                        : CircleAvatar(
                            radius: 50,
                            foregroundImage: FileImage(File(global.pic1!.path)),
                          ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "${Contactprovider.allcontact[index].MobileNumber}",
                        style: TextStyle(
                            color: (Provider.of<themeprovider>(context,
                                            listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    trailing: Text(
                      "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}  \n ${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}",
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              heightFactor: 35,
              child: Text(
                "No any call yet...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: (Provider.of<themeprovider>(context, listen: true)
                              .theme3
                              .isdark ==
                          false)
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
    );
  }
}
