import 'dart:io';

import 'package:ch_2/global.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/datetimeprovider.dart';

class call extends StatefulWidget {
  call({Key? key}) : super(key: key);

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (Contactprovider.allcontact.isNotEmpty)
            ? ListView.builder(
                itemCount: Contactprovider.allcontact.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      launchUrl(Uri(
                        scheme: 'tel',
                        path: "+91 ${global.mobilenumber}",
                      ));
                    },
                    child: ListTile(
                      trailing: const Icon(Icons.call),
                      leading: CircleAvatar(
                        radius: 50,
                        foregroundImage: FileImage(File(global.pic1!.path)),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          Contactprovider.allcontact[index].MobileNumber,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
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
