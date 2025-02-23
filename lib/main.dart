import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo/core/dependency_injection.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/task/domain/repositories/task_repository.dart';
import 'package:todo/task/presentation/cubit/task_cubit.dart';
import 'package:todo/task/presentation/views/task_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit(locator<TaskRepository>())..getTasks()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        theme: ThemeData(
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es', ''), Locale('en', '')],
        home: TaskView(),
      ),
    );
  }
}
