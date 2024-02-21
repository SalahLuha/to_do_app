import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/task/presentation/screens/add_task_screen/add_task_screen.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/elevated_button_widgets.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/task_component.dart';

import '../../cubit/task_cubit.dart';
import '../../cubit/task_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 28)),

                SizedBox(
                  height: height * 0.01,
                ),
                Text(AppString.today,
                    style: Theme.of(context).textTheme.displayLarge),

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
                BlocProvider.of<TaskCubit>(context).tasksList.isEmpty
                    ? noTasksWidget(context)
                    :

                    //Center(child: noTasksWidget(context)),
                    ListView.builder(
                        itemCount: BlocProvider.of<TaskCubit>(context)
                            .tasksList
                            .length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(24),
                                    height: height * .35,
                                    color: AppColors.deepGrey,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * .07,
                                          width: double.infinity,
                                          child: ElevatedButtonWidgets(
                                              text: AppString.taskCompleted,
                                              onTap: () {}),
                                        ),
                                        SizedBox(
                                          height: height * .03,
                                        ),
                                        SizedBox(
                                          height: height * .07,
                                          width: double.infinity,
                                          child: ElevatedButtonWidgets(
                                            text: AppString.deleteTask,
                                            onTap: () {},
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * .03,
                                        ),
                                        SizedBox(
                                          height: height * .07,
                                          width: double.infinity,
                                          child: ElevatedButtonWidgets(
                                            text: AppString.cancel,
                                            onTap: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: TaskComponent(
                              taskModel: BlocProvider.of<TaskCubit>(context)
                                  .tasksList[index],
                            ),
                          );
                        },
                      ),
              ],
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddTaskScreen(),
              ),
            );
          },
          child: const Icon(Icons.add, color: AppColors.white),
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
