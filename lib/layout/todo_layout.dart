import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/shared/styles/colors.dart';
import 'package:note_app/shared/styles/icon_broken.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../modules/Search_screen/Search_screen.dart';
import '../shared/component/components.dart';

class todo extends StatelessWidget
{
  var formkey=GlobalKey<FormState>();
  var Scaffoldkey=GlobalKey<ScaffoldState>();
  var titlecontroller=TextEditingController();
  var timecontroller=TextEditingController();
  var datecontroller=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>appcubit()..createdatabase(),
      child: BlocConsumer<appcubit,appstates>(
        listener: (context,state){
          if(state is appinsertdatabasestate){
            Navigator.pop(context);
          }
        },
        builder: (context,state)=>Scaffold(
          key:Scaffoldkey ,
          appBar: AppBar(
            title: Text(
              appcubit.get(context).titles[appcubit.get(context).indx],
              style: Theme.of(context).textTheme.bodyText1,
            ),
            actions: [
              IconButton(
                icon: Icon(IconBroken.Search),
                onPressed: (){
                  navto(context, Search_screen());
                },
              ),
            ],
          ),
          floatingActionButton:FloatingActionButton(
            backgroundColor: defaultcolor.withOpacity(0.7),
              child:Icon(appcubit.get(context).fabicon),
              onPressed: () {
                if (appcubit.get(context).boolean) {
                  if (formkey.currentState!.validate()) {
                    appcubit.get(context).insertdatabase(
                      title: titlecontroller.text,
                      time: timecontroller.text,
                      date: datecontroller.text,
                    );
                  }
                }
                else {
                  Scaffoldkey.currentState!.showBottomSheet((context) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.grey[100],
                        width: double.infinity,
                        height: 250,
                        child: Center(
                          child: Form(
                            key: formkey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  formfield(
                                      controller: titlecontroller,
                                      prefix: Icons.title,
                                      type: TextInputType.text,
                                      label: "title",
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'title must not be empty';
                                        } else {
                                          return null;
                                        }
                                      }
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  formfield(
                                      controller: timecontroller,
                                      prefix: Icons.access_time,
                                      type: TextInputType.datetime,
                                      label: "time",
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timecontroller.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'time must not be empty';
                                        } else {
                                          return null;
                                        }
                                      }
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  formfield(
                                    controller: datecontroller,
                                    prefix: Icons.calendar_today,
                                    type: TextInputType.datetime,
                                    label: "date",
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2023-05-03'),
                                      ).then((value) {

                                        datecontroller.text = DateFormat.yMMMEd().format(value!);

                                      });
                                    },
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'date must not be empty';
                                      } else {
                                        return null;
                                      }
                                    },

                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).closed.then((value) {
                    appcubit.get(context).changebottomsheet(isshow: false, icon: IconBroken.Edit);
                  });
                  appcubit.get(context).changebottomsheet(isshow: true, icon: IconBroken.Add_User);
                  //},
                }
              }
          ),


          body:ConditionalBuilder(
            condition:state is!appgetdatabaseloadingstate ,
            fallback:(context)=>Center(child: CircularProgressIndicator()) ,
            builder:(context)=>appcubit.get(context).screen[appcubit.get(context).indx],
          ) ,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: appcubit.get(context).indx,
            onTap: (index){

              appcubit.get(context).changeindex(index);

            },
            items: [

              BottomNavigationBarItem(
                icon:Icon( Icons.my_library_books_sharp),
                label:'new tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.done),
                label: 'done tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined),
                label: 'archived tasks',
              ),

            ],
          ),
        ),

      ),
    );
  }


}