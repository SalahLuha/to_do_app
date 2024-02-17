
import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/task/presentation/screens/widgets/custom_text_field.dart';

class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({super.key});
TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },

        ),
        title:  Text(AppString.addTasks,style: Theme.of(context).textTheme.displayLarge),

      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(AppString.title,style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 8,),
              CustomFormTextField(

                Controller: titleController,
                hinttext: AppString.titleHint,
              ),

              const SizedBox(height: 24,),

              Text(AppString.title,style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 8,),
              CustomFormTextField(

                hinttext: AppString.titleHint,
              ),


            ],
          ),
        ),
      ),

    );
  }
}
