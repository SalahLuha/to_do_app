import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/bloc/bloc_observer.dart';
import 'package:to_do_app/features/task/presentation/cubit/task_cubit.dart';

import 'app/app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  runApp(
    BlocProvider(create: (context) => TaskCubit(), child: const MyApp()),
  );
}
