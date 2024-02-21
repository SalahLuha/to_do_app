import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/elevated_button_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/commons/commons.dart';

class AddTaskScreen extends StatelessWidget {


  const AddTaskScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocConsumer<TaskCubit, TaskState>(
            listener: (context, state) {
              if (state is InsertTaskSucessState) {
                showToast(
                    message: 'Added Sucessfully', state: ToastStates.success);
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<TaskCubit>(context);
              return Form(
                key: BlocProvider.of<TaskCubit>(context).formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!title
                    CustomFormTextField(
                      hider: AppString.title,
                      hintText: AppString.titleHint,
                      Controller:
                          BlocProvider.of<TaskCubit>(context).titleController,
                    ),

                    SizedBox(
                      height: 24.h,
                    ),

                    CustomFormTextField(
                      hider: AppString.note,
                      hintText: AppString.noteHint,
                      Controller:
                          BlocProvider.of<TaskCubit>(context).noteController,
                    ),

                    SizedBox(
                      height: 24.h,
                    ),
                    //date
                    CustomFormTextField(
                      hider: AppString.date,
                      hintText: DateFormat.yMd().format(cubit.currentDate),
                      sufficIcon: IconButton(
                        onPressed: () async {
                          cubit.getDate(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                        ),
                      ),
                      readOnly: true,
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
                            hintText: cubit.startTime,
                            sufficIcon: IconButton(
                              onPressed: () async {
                                cubit.getStartTime(context);
                              },
                              icon: const Icon(Icons.timer_outlined),
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 26.w,
                        ),
                        //End
                        Expanded(
                          child: CustomFormTextField(
                            readOnly: true,
                            hider: AppString.endTime,
                            hintText: cubit.endTime,
                            sufficIcon: IconButton(
                              onPressed: () async {
                                cubit.getEndTime(context);
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
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 8.w),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<TaskCubit>(context)
                                        .changeCheckMarkIndex(index);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        BlocProvider.of<TaskCubit>(context)
                                            .getColor(index),
                                    child: index ==
                                            BlocProvider.of<TaskCubit>(context)
                                                .currentIndex
                                        ? const Icon(Icons.check)
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //! add Task Button
                    SizedBox(
                      height: 90.h,
                    ),

                    state is InsertTaskLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ))
                        : SizedBox(
                            height: 48.h,
                            width: double.infinity,
                            child: ElevatedButtonWidgets(
                              text: AppString.createTask,
                              onTap: () {
                                if (BlocProvider.of<TaskCubit>(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<TaskCubit>(context)
                                      .insertTask();
                                }
                              },
                            ),
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
