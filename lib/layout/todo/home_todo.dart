import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/cubit/cubit.dart';
import 'package:alhumiri_frist_project/Shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';



class Homelayout extends StatelessWidget {
  var  scafflodKey=  GlobalKey <ScaffoldState> ();
  var  foemKey=  GlobalKey <FormState> ();
  var titelcontlolr=TextEditingController();
  var taimcontloel=TextEditingController();
  var datrcntleler=TextEditingController();

  Database? database;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context)=>Appcubit()..creatdb(),
    child:BlocConsumer<Appcubit,AppStates> (

      listener: (context, state){
        if (state is AppInsertToDataBauestate){
           Navigator.pop(context);
        }
      },
      builder: (context, state){
        var cubit=Appcubit.get(context);
        return Scaffold(
          key:  scafflodKey,
          appBar: AppBar(
            title: Text(
              cubit.titelText[cubit.currentIndex],

            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()  {

              if(cubit.icon_edit_or_add) {
                if(foemKey.currentState!.validate()){

              cubit.insert_to_db(title: titelcontlolr.text,time: taimcontloel.text,date: datrcntleler.text);
                  cubit.chingIcon(icon_edit_or_add:false , icon: Icons.edit);

                }

              }
              else {


                scafflodKey.currentState!.showBottomSheet((context) =>
                    Container(
                      color: Colors.white,

                      padding: EdgeInsetsDirectional.all(20.0),
                      child: Form(
                        key: foemKey,

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defultTextFormFaild(contloler: titelcontlolr,
                                textInputType: TextInputType.text,
                                prefixicon: Icons.title,
                                labelText: 'Task titel',
                                textValidator: 'the titel most don\'t by empty'),
                            SizedBox(
                              height: 15,
                            ),
                            defultTextFormFaild(contloler: taimcontloel,
                                textInputType: TextInputType.text,
                                prefixicon: Icons.watch_later_outlined,
                                labelText: 'Task taime',
                                textValidator: 'the time most don\'t by empty',
                                ontap: () {

                                  showTimePicker(context: context,
                                      initialTime: TimeOfDay.now()).then((value) {
                                    taimcontloel.text = value!.format(context);
                                  });

                                }),
                            SizedBox(
                              height: 15,
                            ),
                            defultTextFormFaild(contloler: datrcntleler,
                                textInputType: TextInputType.text,
                                prefixicon: Icons.date_range_outlined,
                                labelText: 'Task date',
                                textValidator: 'the date most don\'t by empty',
                                ontap: () {

                                  showDatePicker(context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-08-05')).then((
                                      value) {
                                    datrcntleler.text = DateFormat.yMMMd().format(value!);
                                  });


                                }),
                          ],

                        ),
                      ),
                    ),
                  elevation: 20,
                ).closed.then((value) {
                  cubit.chingIcon(icon_edit_or_add: false, icon: Icons.edit);


                });
                cubit.chingIcon(icon_edit_or_add: true, icon: Icons.add);




              }
            },
            child: Icon(cubit.icon),
          ),
          body:false? Center(child: CircularProgressIndicator()) :Appcubit.get(context).body_screan[Appcubit.get(context).currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            type:BottomNavigationBarType.fixed,
            currentIndex:Appcubit.get(context). currentIndex,
            onTap: (index){
              Appcubit.get(context).chingIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(
                Icons.menu,

              ),
                  label: 'Task'),
              BottomNavigationBarItem(icon: Icon(
                Icons.done_outlined,

              ),
                  label: 'Done'),
              BottomNavigationBarItem(icon: Icon(
                Icons.archive_outlined,

              ),
                  label: 'Archive'),
            ],
          ),
        );
      } ,
    ));

  }
  // Future<String>  getname() async {
  //   return 'ziad alhumiri';
  // }






}

