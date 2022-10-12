
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/states.dart';
import 'package:note_app/shared/network/local/cache_helper.dart';
import 'package:note_app/shared/styles/icon_broken.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/Archived_tasks_screen/Archived_tasks_screen.dart';
import '../modules/Done_tasks_screen/Done_tasks_screen.dart';
import '../modules/New_tasks_screen/New_tasks_screen.dart';




class appcubit extends Cubit<appstates>
{
  appcubit():super(initial());
  static appcubit get(context)=>BlocProvider.of(context);
  int indx=0;
  IconData fabicon=IconBroken.Edit;

  bool boolean=false;
  List<Map>newtasks=[];
  List<Map>donetasks=[];
  List<Map>archivedtasks=[];

  List<Widget>screen=[
    newtask(),
    done(),
    archivedtask(),
  ];
  List <String>titles=[
    'new tasks',
    'done tasks',
    'archived tasks',
  ];
  void updatedatabase(
      {
        required String status,
        required    int id,
      }
      )async
  {
    await database.rawUpdate(
        'UPDATE Tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getdatabase(database);
      emit(appupdatedatabasestate());
    });
  }
  void deletedatabase(
      {
        required    int id,
      }
      )async
  {
    await database.rawDelete(
        'DELETE FROM Tasks WHERE id = ?',
        [id]).then((value) {
      getdatabase(database);
      emit(appdeletedatabasestate());
    });
  }
  void changeindex (int index)
  {
    indx=index;
    emit(changebottomnavbar());
  }
  late Database database;
  void createdatabase()
  {
    openDatabase(
      "todo.db",
      version: 1,
      onCreate: (database,version)async{
        print('database created');
        await database.execute(
            'CREATE TABLE Tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT ,time TEXT,status TEXT)'
        ).then(
                (value){
              print('table created');
            }
        ).catchError((erorr){
          print('erorr when creating table ${erorr.toString()}');
        });
      },
      onOpen: (database){
        getdatabase(database);
        print('database opend');
      },
    ).then((value) {
      database=value;

      emit(appcreatedatabasestate());
    });
  }

 Future<void> insertdatabase(
      {
        required String title,
        required String time,
        required String date,
      }
      )
  async {
    return  database.transaction((txn) async{
      await txn.rawInsert(
          'INSERT INTO Tasks (title,date,time,status)VALUES("$title","$date","$time","new")'
      ).then((value) {
        print('$value inserted sucessfully');
        emit(appinsertdatabasestate());
        getdatabase(database);
      }).catchError((erorr) {
        'erorr when inserting data${erorr.toString()}';
      });
      return null;
    });
  }
  void getdatabase(database)
  {
    newtasks=[];
    donetasks=[];
    archivedtasks=[];
    emit(appgetdatabaseloadingstate());
    database.rawQuery('SELECT * FROM Tasks ').then((value){

      value.forEach((element){
        if(element["status"]=="new")
          newtasks.add(element);
        else if(element["status"]=="done")
          donetasks.add(element);
        else if(element["status"]=="archived")
          archivedtasks.add(element);

      });
      emit(appgetdatabasestate());
    });;
  }

  void changebottomsheet({
    required bool isshow,
    required IconData icon,
  })
  {
    boolean=isshow;
    fabicon=icon;
    emit(appbottomsheetstate());
  }
  bool isdark=false;
  changemode({ bool? formshare})
  {
    if (formshare!=null)
      isdark=formshare;
    else
      isdark=!isdark;

    cachehelper.putdata(key: "isdark", value: isdark).then((value) {emit(changethememode());});

  }
  List<Map>search=[];
  Future<void> getSearch(String?values)async
  {
    search = [];
   await database.rawQuery('SELECT * FROM Tasks ').then((value)
    {
      value.forEach((element) {
        if (element["title"].toString().toLowerCase().startsWith(element["${values}"].toString().toLowerCase())) {
          search.add(element);
        }
      });
    });
    emit(SocialGetSearchUserSuccessState());
  }

  }

