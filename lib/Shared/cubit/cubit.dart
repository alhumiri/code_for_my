import 'package:alhumiri_frist_project/Shared/cubit/states.dart';
import 'package:alhumiri_frist_project/modules/todo_app/archive_task/arckive_task_screan.dart';
import 'package:alhumiri_frist_project/modules/todo_app/done_task/done_task_screan.dart';
import 'package:alhumiri_frist_project/modules/todo_app/new_Task/new_task_screan.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class Appcubit extends Cubit<AppStates> {
  Appcubit() : super(Appinitielsate());
  static Appcubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool icon_edit_or_add = false;
  IconData icon = Icons.edit;
  late Database database;
  List<Map> new_tasks_data = [];
  List<Map> done_tasks_data = [];
  List<Map> archiv_tasks_data = [];

  void chingIcon({
    required bool icon_edit_or_add,
    required IconData icon,
  }) {
    this.icon_edit_or_add = icon_edit_or_add;
    this.icon = icon;
    emit(AppIconChingState());
  }

  List<Widget> body_screan = [
    NewScrean(),
    DoneScrean(),
    ArchiveScrean(),
  ];
  List<String> titelText = [' New Tasks', 'Done Tasks', 'Archive Tasks'];
  void chingIndex(int index) {
    currentIndex = index;
    emit(AppBouttonCrentIndexChingState());
  }

  void creatdb() {
    openDatabase('todo.db', version: 1, onCreate: (Database db, version) {
      db
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,taim TEXT,stat TEXT)')
          .then((value) {
        print('creat db');
      }).catchError((eror) {
        print(eror.toString() + "فشل انشاء قاعدة البيانات ");
      });
    }, onOpen: (db) {
      print('تم فتح قاعدة البيانات');
      get_data(db);
    }).then((value) {
      this.database = value;
      emit(AppCreatDataBauestate());
    });
  }

  void insert_to_db({
    required String title,
    required String date,
    required String time,
  }) {
    database.transaction((txn) async {
      txn
          .rawInsert(
              'insert into tasks ("title","date","taim","stat") values (" ${title}","${date}","${time}","new")')
          .then((value) {
        emit(AppInsertToDataBauestate());
        get_data(database);
      }).catchError((eror) {
        print('${eror}   لم يتم اضافة البيانات  ');
      });
      return null;
    });
  }

  void UbdateData({
    required String state,
    required int id,
  }) {
    database.rawUpdate(
        'UPDATE tasks SET stat = ? WHERE id = ?', [state, id]).then((value) {
      get_data(database);
      emit(AppUpDateDataBauestate());
    });
  }

  void DaleteData({
    required int id,
  }) {
    database.rawDelete('DELETE FROM tasks  WHERE id = ?', [id]).then((value) {
      get_data(database);
      emit(AppDeletFromDataBauestate());
    });
  }

  void get_data(database) {
    new_tasks_data = [];
    done_tasks_data = [];
    archiv_tasks_data = [];

    database.rawQuery('select * from tasks').then((value) {
      value.forEach((elment) {
        if (elment['stat'] == 'new') {
          new_tasks_data.add(elment);
        } else if (elment['stat'] == 'done') {
          done_tasks_data.add(elment);
        } else {
          archiv_tasks_data.add(elment);
        }
      });

      emit(AppGetDataFromDataBauestate());
    });
  }
}
