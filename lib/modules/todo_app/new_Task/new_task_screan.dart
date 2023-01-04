import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/cubit/cubit.dart';
import 'package:alhumiri_frist_project/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NewScrean extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<Appcubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List tasks_data= Appcubit.get(context).new_tasks_data;
        return tasks_data.length > 0 ? ListView.separated(
            itemBuilder:(context ,index)=>  bulid_item_tasks( tasks_data[index],context),
            separatorBuilder:(context ,index)=>Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[200],
            ),
            itemCount: tasks_data.length):Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Icon(Icons.menu,
              color: Colors.grey,
              size: 100,),
              Text('No Tasks Yet ,Please add some Tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),)
          ],
        ),
            );
      }

    );

  }
}
