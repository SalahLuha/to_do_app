import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/task/presentation/screens/add_task_screen/add_task_screen.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/elevated_button_widgets.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/task_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(DateFormat.yMMMMd().format(DateTime.now()),
                      style: Theme.of(context).textTheme.displayLarge),
                ],
              ),

               SizedBox(
                height: 12.h,
              ),
              Text(AppString.today,
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: 8.h,
              ),
              DatePicker(
                //Size.fromHeight(10,),
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: AppColors.white,
                dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                onDateChange: (date) {
                  // New date selected
                },
              ),
          const SizedBox(height: 24),

          //no tasks
              //Center(child: noTasksWidget(context)),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(24),
                            height: 200.h,
                            color: AppColors.deepGrey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 48.h,
                                  width: double.infinity,
                                  child: ElevatedButtonWidgets(
                                      text: AppString.taskCompleted,
                                      onTap: () {}
                                  ),
                                ),
                                 SizedBox(height: 24.h),
                                SizedBox(
                                  height: 48.h,
                                  width: double.infinity,
                                  child: ElevatedButtonWidgets(
                                      text: AppString.deleteTask,
                                      onTap: () {},
                                    backgroundColor: Colors.red,

                                  ),
                                ),
                                 SizedBox(height: 24.h),
                                SizedBox(
                                  height: 48.h,
                                  width: double.infinity,
                                  child: ElevatedButtonWidgets(
                                      text: AppString.cancel,
                                      onTap: () {

                                      }
                                  ),
                                ),
                              ],
                            ),
                          );

                        });

                  },

                  child: const TaskComponent()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>   AddTaskScreen(),
              ),
            );
          },
          child: const Icon(Icons.add,color: AppColors.white),
        ),
      ),
    );
  }

  Column noTasksWidget(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 50.h,
        ),
        Image.asset(AppAssets.noTasks),
        Text(
          AppString.noTaskTitle,
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24),
        ),
        Text(AppString.noTaskSubTitle,
            style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}
