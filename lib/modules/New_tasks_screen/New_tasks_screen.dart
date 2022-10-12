import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../shared/component/components.dart';



class newtask extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<appcubit,appstates>(
      listener: (context,state){},
      builder: (context,state)=>ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=>itembuilder(appcubit.get(context).newtasks[index],context),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        itemCount: appcubit.get(context).newtasks.length,
      ),
    );

  }

}