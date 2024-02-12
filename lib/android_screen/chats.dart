import 'dart:io';
import 'package:ch_2/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/datetimeprovider.dart';

class chats extends StatelessWidget {
  chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (Contactprovider.allcontact.isNotEmpty)
            ? ListView.builder(
                itemCount: Contactprovider.allcontact.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      launchUrl(
                        Uri(
                          scheme: 'sms',
                          path:
                              "+91 ${Contactprovider.allcontact[index].MobileNumber}",
                        ),
                      );
                    },
                    child: ListTile(
                      leading: (global.pic1 == null)
                          ? const Icon(
                              Icons.add_a_photo_outlined,
                              color: Color.fromARGB(255, 80, 75, 81),
                              size: 30,
                            )
                          : CircleAvatar(
                              radius: 50,
                              foregroundImage:
                                  FileImage(File(global.pic1!.path)),
                            ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          Contactprovider.allcontact[index].Firstname,
                          style: const TextStyle(
                            fontSize: 20,
                            // color: Color.fromARGB(255, 23, 18, 18),
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(Contactprovider.allcontact[index].Email),
                      ),
                      trailing: Text(
                          "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}   ${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}"),
                    ),
                  );
                },
              )
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("NO contact add"),
                  ],
                ),
              ));
  }
}
