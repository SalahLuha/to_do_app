import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_state.dart';

import '../../../../core/utils/app_colors.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(
    DateTime.now().add(
      const Duration(minutes: 45),
    ),
  );
  int currentIndex = 0;

  void getDate(context) async {
    emit(GetDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2052),
      //initialDatePickerMode: DatePickerMode.day,
      //initialEntryMode: DatePickerEntryMode.inputOnly,
    );
    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSucessState());
    } else {
      print('pickedDate == null');
      emit(GetDateLoadingState());
    }
  }


  //getStartTime
  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());

    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedStartTime != null) {
      emit(GetStartTimeSucessState());

      startTime = pickedStartTime.format(context);
    } else {
      emit(GetStartTimeErrorState());

      print('pickedStartTime == null');
    }
  }
  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());

    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedStartTime != null) {
      emit(GetEndTimeSucessState());

      endTime = pickedStartTime.format(context);
    } else {
      emit(GetEndTimeErrorState());

      print('pickedStartTime == null');
    }
  }
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
  void changeCheckMarkIndex(index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

}
