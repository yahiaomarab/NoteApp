import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/cubit.dart';

import '../../cubit/states.dart';
import '../../shared/component/components.dart';

class Search_screen extends StatelessWidget
{
  var searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 10,
            ),
            child: Column(
              children: [
                formfield(
                  controller: searchcontroller,
                  type: TextInputType.text,
                  validate: (String? value){
                    if(value!.isEmpty)
                      return 'what you want';
                    else
                      return null;
                  },
                  label: 'search',
                  onChanged: (value){
                    appcubit.get(context).getSearch(value);
                  },
                  prefix: Icons.search,
                ),
                Expanded(
                    child:ConditionalBuilder(
                      condition: appcubit.get(context).newtasks.length>0,
                      builder: (context) => appcubit.get(context).search.isNotEmpty ? ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context , index) => buildSearchItem(appcubit.get(context).search[index] , context),
                          separatorBuilder: (context , index) => dividorline(),
                          itemCount: appcubit.get(context).search.length
                      ) :  ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context , index) => buildSearchItem(appcubit.get(context).newtasks[index] , context),
                          separatorBuilder: (context , index) => dividorline(),
                          itemCount: appcubit.get(context).newtasks.length
                      ),
                      fallback: (context) =>  Center(
                        child: Container(),
                      ) ,

                    )
                ),
              ],
            ),
          ),
        );
      },

    );
  }

}