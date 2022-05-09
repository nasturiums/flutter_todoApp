import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_flutter/services/notifi_services.dart';
import 'package:to_do_app_flutter/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:to_do_app_flutter/ui/AddTaskPages.dart';
import 'package:to_do_app_flutter/ui/Widget/button.dart';
import 'package:to_do_app_flutter/ui/theme.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);
  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  var _selectedDate;
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
        _addTaskBar(),
        _addDateBar(),
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

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          MyButton(
              label: "+ Add Task",
              onTap: () {
                Get.to(const AddTasksPage());
              })
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: DatePicker(
        DateTime.now(),
        width: 80,
        height: 100,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryKcolor,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey)),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }
}
