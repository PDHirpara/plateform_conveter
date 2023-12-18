import 'dart:io';

import 'package:ch_2/provider/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ch_2/global.dart';
import '../provider/platformprovider.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (Provider.of<profileprovider>(context, listen: true).Plat1.isios1 ==
              false)
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 90.0),
                        child: Text(
                          " Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      Switch(
                          value: Provider.of<profileprovider>(context,
                                  listen: true)
                              .Plat1
                              .isios1,
                          onChanged: (val) {
                            Provider.of<profileprovider>(context, listen: false)
                                .changeprofile1(val);
                          }),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 90.0),
                            child: Text(
                              " Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                          Switch(
                              value: Provider.of<profileprovider>(context,
                                      listen: true)
                                  .Plat1
                                  .isios1,
                              onChanged: (val) {
                                Provider.of<profileprovider>(context,
                                        listen: false)
                                    .changeprofile1(val);
                              }),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 90.0),
                        child: Text(
                          " Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      Switch(
                          value: Provider.of<profileprovider>(context,
                                  listen: true)
                              .Plat1
                              .isios1,
                          onChanged: (val) {
                            Provider.of<profileprovider>(context, listen: false)
                                .changeprofile1(val);
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: GestureDetector(
                    onTap: () async {
                      final XFile? image = await global.picker
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        global.pic = image;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      child: Stack(
                        children: [
                          if (global.pic == null)
                            Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.purple,
                              size: 30,
                            )
                          else
                            CircleAvatar(
                              radius: 50,
                              foregroundImage:
                                  FileImage(File(global.pic!.path)),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "enter your name...",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0))),
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "enter your bio...",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(right: 40.0, top: 10),
                        child: Text(
                          "save",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "cancel",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 29,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Icons.sunny
                                : Icons.dark_mode,
                            color: Colors.grey,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              (Provider.of<themeprovider>(context, listen: true)
                                          .theme3
                                          .isdark ==
                                      false)
                                  ? "wanna sunny"
                                  : "wanna dark",
                              style: TextStyle( 
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                          Switch(
                              value: Provider.of<profileprovider2>(context,
                                      listen: true)
                                  .Plat2
                                  .isios2,
                              onChanged: (val) {
                                Provider.of<themeprovider>(context,
                                        listen: false)
                                    .changetheme();
                                Provider.of<profileprovider2>(context,
                                        listen: false)
                                    .changeprofile2(val);
                              }),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
