import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ch_2/global.dart';

class setting1 extends StatefulWidget {
  setting1({Key? key}) : super(key: key);

  @override
  State<setting1> createState() => _setting1State();
}

class _setting1State extends State<setting1> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          GestureDetector(
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
        ],
      ),
    ));
  }
}
