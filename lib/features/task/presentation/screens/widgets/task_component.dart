
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 132,
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
                  'Task 1',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.timer,color: Colors.white),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '09:33 PM - 09:48 PM',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Learn Dart',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Container(


            height: 110,
            width: 2.5,
            color: Colors.white,

          ),
          const SizedBox(
            width: 10,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              AppString.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),),
        ],
      ),
    );
  }
}