import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ch_2/global.dart';
import 'package:provider/provider.dart';

import '../provider/platformprovider.dart';
import '../provider/themeprovider.dart';

class setting1 extends StatefulWidget {
  setting1({Key? key}) : super(key: key);

  @override
  State<setting1> createState() => _setting1State();
}

class _setting1State extends State<setting1> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: (Provider.of<profileprovider>(context, listen: true)
                  .Plat1
                  .isios1 ==
              false)
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CupertinoListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color:
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                  leading: const Icon(
                    CupertinoIcons.person,
                    color: Colors.blue,
                  ),
                  trailing: CupertinoSwitch(
                    value: Provider.of<profileprovider>(context, listen: true)
                        .Plat1
                        .isios1,
                    onChanged: (val) {
                      Provider.of<profileprovider>(context, listen: false)
                          .changeprofile1(val);
                    },
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 29,
                ),
                CupertinoListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      (Provider.of<themeprovider>(context, listen: true)
                                  .theme3
                                  .isdark ==
                              false)
                          ? "wanna sunny"
                          : "wanna dark",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color:
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                  leading: Icon(
                    (Provider.of<themeprovider>(context, listen: true)
                                .theme3
                                .isdark ==
                            true)
                        ? CupertinoIcons.sun_max
                        : CupertinoIcons.moon,
                    color: Colors.blue,
                    size: 25,
                  ),
                  trailing: CupertinoSwitch(
                      value:
                          Provider.of<profileprovider2>(context, listen: true)
                              .Plat2
                              .isios2,
                      onChanged: (val) {
                        Provider.of<themeprovider>(context, listen: false)
                            .changetheme();
                        Provider.of<profileprovider2>(context, listen: false)
                            .changeprofile2(val);
                      }),
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CupertinoListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                  leading: const Icon(
                    CupertinoIcons.person,
                    color: Colors.blue,
                  ),
                  trailing: CupertinoSwitch(
                    value: Provider.of<profileprovider>(context, listen: true)
                        .Plat1
                        .isios1,
                    onChanged: (val) {
                      Provider.of<profileprovider>(context, listen: false)
                          .changeprofile1(val);
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final XFile? image = await global.picker1
                            .pickImage(source: ImageSource.camera);
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
                              const Icon(
                                Icons.add_a_photo_outlined,
                                color: Color.fromARGB(255, 80, 75, 81),
                                size: 30,
                              )
                            else
                              CircleAvatar(
                                radius: 50,
                                foregroundImage:
                                    FileImage(File(global.pic1!.path)),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoTextField(
                      textAlign: TextAlign.center,
                      placeholder: "enter your name...",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoTextField(
                      textAlign: TextAlign.center,
                      placeholder: "enter your bio...",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 40.0, top: 10),
                            child: Text(
                              "save",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "cancel",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  height: 25,
                ),
                CupertinoListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      (Provider.of<themeprovider>(context, listen: true)
                                  .theme3
                                  .isdark ==
                              false)
                          ? "wanna sunny"
                          : "wanna dark",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color:
                            (Provider.of<themeprovider>(context, listen: true)
                                        .theme3
                                        .isdark ==
                                    false)
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                  leading: Icon(
                    (Provider.of<themeprovider>(context, listen: true)
                                .theme3
                                .isdark ==
                            true)
                        ? CupertinoIcons.sun_max
                        : CupertinoIcons.moon,
                    color: Colors.blue,
                    size: 25,
                  ),
                  trailing: CupertinoSwitch(
                    value: Provider.of<profileprovider2>(context, listen: true)
                        .Plat2
                        .isios2,
                    onChanged: (val) {
                      Provider.of<themeprovider>(context, listen: false)
                          .changetheme();
                      Provider.of<profileprovider2>(context, listen: false)
                          .changeprofile2(val);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
