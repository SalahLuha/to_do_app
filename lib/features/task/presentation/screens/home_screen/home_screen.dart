import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

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
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 12,
              ),
              Text(AppString.today,
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 12,
              ),
              DatePicker(
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
              //no tasks
              noTasksWidget(context),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: AppColors.primary,
          onPressed: () {},
        ),
      ),
    );
  }

  Column noTasksWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
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
