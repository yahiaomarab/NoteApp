
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/layout/todo_layout.dart';
import 'package:note_app/shared/network/local/cache_helper.dart';
import 'package:note_app/shared/network/remote/dio_helper.dart';
import 'package:note_app/shared/styles/themes.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  //DioHelper.init();
  await  cachehelper.init();
  bool isDark=cachehelper.Gettdata(key: "isdark");




  runApp( MyApp(
    isDark,
  ));
}
class MyApp extends StatelessWidget {
  final bool isDark;


  MyApp(this.isDark);



  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) =>
          appcubit()
            ..changemode(
              formshare: isDark,
            ),
        ),

      ],
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            home: todo(),
          );
        },
      ),

    );
  }

}
