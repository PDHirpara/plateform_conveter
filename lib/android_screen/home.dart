import 'package:ch_2/android_screen/call.dart';
import 'package:ch_2/android_screen/chats.dart';
import 'package:ch_2/android_screen/settings.dart';

import 'package:ch_2/provider/platformprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'man.dart';

class home extends StatelessWidget {
  home({Key? key}) : super(key: key);

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.group_add),
              ),
              Tab(
                  child: Text(
                "Chats",
                style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )),
              Tab(
                  child: Text(
                "Call",
                style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )),
              Tab(
                  child: Text(
                "Setting",
                style: TextStyle(
                    // color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )),
            ],
          ),
          title: const Text(
            'Plateform',
          ),
          actions: [
            Switch(
                value: Provider.of<platformprovider>(context, listen: true)
                    .Plat
                    .isios,
                onChanged: (val) {
                  Provider.of<platformprovider>(context, listen: false)
                      .changePlatform(val);
                })
          ],
        ),
        body: TabBarView(
          children: [
            ///////////  man
            man(),

            /// chats
            chats(),

            /// call
            call(),

            /////////// setting

            Settings(),
          ],
        ),
      ),
    );
  }
}
