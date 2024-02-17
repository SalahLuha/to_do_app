import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/elevated_button_widgets.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(
    DateTime.now().add(
      const Duration(minutes: 45),
    ),
  );
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppString.addTasks,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!title
                CustomFormTextField(
                  hider: AppString.title,
                  hintText: AppString.titleHint,
                  Controller: titleController,
                ),

                SizedBox(
                  height: 24.h,
                ),

                CustomFormTextField(
                  hider: AppString.note,
                  hintText: AppString.noteHint,
                  Controller: noteController,
                ),

                SizedBox(
                  height: 24.h,
                ),
                //date
                CustomFormTextField(
                  hider: AppString.date,
                  hintText: DateFormat.yMd().format(currentDate),
                  sufficIcon: IconButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2052),
                        //initialDatePickerMode: DatePickerMode.day,
                        //initialEntryMode: DatePickerEntryMode.inputOnly,
                      );
                      setState(() {
                        if (pickedDate != null) {
                          currentDate = pickedDate;
                        } else {
                          print('pickedDate == null');
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                    ),
                  ),
                  readOnly: true,
                  Controller: noteController,
                ),

                SizedBox(
                  height: 24.h,
                ),

                //Start and End
                Row(
                  children: [
                    //Start
                    Expanded(
                      child: CustomFormTextField(
                        readOnly: true,
                        hider: AppString.startTime,
                        hintText: startTime,
                        sufficIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedStartTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                            );
                            if (pickedStartTime != null) {
                              setState(() {
                                startTime = pickedStartTime.format(context);
                              });
                            } else {
                              print('pickedStartTime == null');
                            }
                          },
                          icon: const Icon(Icons.timer_outlined),
                          color: Colors.white,
                        ),
                      ),
                    ),
                     SizedBox(
                      width: 8.w,
                    ),
                    //End
                    Expanded(
                      child: CustomFormTextField(
                        readOnly: true,
                        hider: AppString.endTime,
                        hintText: endTime,
                        sufficIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedEndDate = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                            );

                            if (pickedEndDate != null) {
                              setState(() {
                                endTime = pickedEndDate.format(context);
                              });
                            } else {
                              print('pickedStartTime == null');
                            }
                          },
                          icon: const Icon(Icons.timer_outlined),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 24.h,
                ),

                //colors
                SizedBox(
                  height: 68.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.colors,
                          style: Theme.of(context).textTheme.displayMedium),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            Color getColor(index) {
                              switch (index) {
                                case 0:
                                  return AppColors.red;
                                case 1:
                                  return AppColors.green;
                                case 2:
                                  return AppColors.blueGrey;
                                case 3:
                                  return AppColors.blue;
                                case 4:
                                  return AppColors.orange;
                                case 5:
                                  return AppColors.purple;
                                default:
                                  return AppColors.grey;
                              }
                            }

                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  currentIndex=index;
                                });

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CircleAvatar(
                                  backgroundColor: getColor(index),
                                  child: index == currentIndex? const Icon(Icons.check):null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90.h,
                ),
                SizedBox(
                  height: 48.h,
                  width: double.infinity,
                  child: ElevatedButtonWidgets(
                      text: AppString.createTasks, onTap: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
