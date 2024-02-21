import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;
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
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: height*.21,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                 SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.timer, color: Colors.white),
                     SizedBox(
                      width: 8.w,
                    ),
                    Text(
                        '${taskModel.startTime} PM -${taskModel.endTime}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  taskModel.note,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Container(
            height: 110.h,
            width: 2.5.w,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              taskModel.isCompleted == 1
                  ? AppString.completed
                  : AppString.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
