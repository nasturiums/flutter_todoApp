import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_flutter/services/notifi_services.dart';
import 'package:to_do_app_flutter/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/ui/Widget/button.dart';
import 'package:to_do_app_flutter/ui/theme.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);
  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  var notifiHelper;
  @override
  void initState() {
    super.initState();
    notifiHelper = NotifiHelper();
    notifiHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: subHeadingStyle,
                    ),
                    Text(
                      "Today",
                      style: headingStyle,
                    )
                  ],
                ),
              ),
              const MyButton(label: "+ Add Task", onTap: null)
            ],
          ),
        ),
      ]),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
          onTap: () {
            ThemeServices().switchTheme();
            notifiHelper.displayNotification(
              title: "Theme change",
              body: Get.isDarkMode ? "Active theme dark" : "Active light theme",
            );
          },
          child: Icon(
            Get.isDarkMode
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round_outlined,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          )),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("images/person.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
