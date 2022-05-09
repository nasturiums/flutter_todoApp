import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_flutter/ui/Widget/inputFiled.dart';
import 'package:to_do_app_flutter/ui/theme.dart';

class AddTasksPage extends StatefulWidget {
  const AddTasksPage({Key? key}) : super(key: key);

  @override
  State<AddTasksPage> createState() => _AddTasksPageState();
}

class _AddTasksPageState extends State<AddTasksPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9.30 PM";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int _selectRemind = 5;
  List<int> remindList = [5, 10, 15, 20, 25];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Add Task",
            style: headingStyle,
          ),
          const MyInputField(
              hint: "Enter Your Title",
              title: "Title",
              controller: null,
              widget: null),
          const MyInputField(
              hint: "Enter Your Note",
              title: "Note",
              controller: null,
              widget: null),
          MyInputField(
              hint: DateFormat.yMd().format(_selectedDate),
              title: "Date",
              controller: null,
              widget: IconButton(
                onPressed: () {
                  _getDatefromUser();
                },
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey,
                ),
              )),
          Row(
            children: [
              Expanded(
                child: MyInputField(
                    title: "Start Date",
                    hint: _startTime,
                    controller: null,
                    widget: IconButton(
                      onPressed: () {
                        _getTimefromUser(isStarTime: true);
                      },
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    )),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: MyInputField(
                    title: "End Date",
                    hint: _endTime,
                    controller: null,
                    widget: IconButton(
                      onPressed: () {
                        _getTimefromUser(isStarTime: false);
                      },
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    )),
              )
            ],
          )
        ])),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
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

  _getDatefromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2122));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      printError();
    }
  }

  _getTimefromUser({required bool isStarTime}) async {
    var pickedTime = await _showTimePicker();
    String _fommattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("time cancel");
    } else if (isStarTime == true) {
      _startTime = _fommattedTime;
    } else if (isStarTime == false) {
      _endTime = _fommattedTime;
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
