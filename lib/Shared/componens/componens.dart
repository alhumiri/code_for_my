import 'dart:ffi';

import 'package:alhumiri_frist_project/Shared/cubit/cubit.dart';
import 'package:alhumiri_frist_project/Shared/stylses/steles.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:alhumiri_frist_project/modules/news_app/web_viwe/web_viwe_screan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defultBoutton({
  Color background = Colors.blue,
  double whith = double.infinity,
  double heght = 40,
  required VoidCallback function,
  required String text,
  bool isupercase = true,
}) =>
    Container(
      width: double.infinity,
      height: heght,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isupercase ? text.toUpperCase() : text.toLowerCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: background,
      ),
    );

Widget defultTextBoutton({
  required VoidCallback function,
  required String text,
})=> TextButton(onPressed: function,
  child: Text(
    text.toUpperCase(),
  ),);
Widget defultTextFormFaild({
  required TextEditingController contloler,
  bool obscureText = false,
  required TextInputType textInputType,
  required IconData prefixicon,
  IconData? suffixicon = null,
  required String labelText,
  VoidCallback? onPrefixIconCleic,
  String? textValidator,
  VoidCallback? ontap,
  ValueChanged? onChanged,
  ValueChanged? onSubmit,
}) =>
    TextFormField(
      keyboardType: textInputType,
      controller: contloler,
      obscureText: obscureText,
      onTap: ontap,
      decoration: InputDecoration(
        suffixIcon:
            IconButton(icon: Icon(suffixicon), onPressed: onPrefixIconCleic),
        labelText: labelText,
        prefixIcon: Icon(prefixicon),
        border: OutlineInputBorder(),
      ),
      validator: (String? v) {
        if (v!.isEmpty) {
          return textValidator;
        } else {
          return null;
        }
      },
      onChanged:onChanged,
      onFieldSubmitted:onSubmit ,
    );

Widget bulid_item_tasks(Map tasks_data, context) => Dismissible(
      key: Key(
        tasks_data['id'].toString(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              child: Text(
                '${tasks_data['taim']}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${tasks_data['title']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${tasks_data['date']}',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            IconButton(
                onPressed: () {
                  Appcubit.get(context)
                      .UbdateData(state: 'done', id: tasks_data['id']);
                },
                icon: Icon(
                  Icons.check_box_outlined,
                  color: Colors.greenAccent,
                )),
            IconButton(
                onPressed: () {
                  Appcubit.get(context)
                      .UbdateData(state: 'arch', id: tasks_data['id']);
                },
                icon: Icon(
                  Icons.archive_outlined,
                  color: Colors.black45,
                )),
          ],
        ),
      ),
      onDismissed: (der) {
        Appcubit.get(context).DaleteData(id: tasks_data['id']);
      },
    );

Widget BulidArticalItime(artical,context) => InkWell(
  onTap: (){
    NavagaorToAntherPage(context, WebViwScren(artical['url']),);
  },
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              width: 120,
  
              height: 120,
  
              decoration: BoxDecoration(
  
                borderRadius: BorderRadius.circular(5.0),
  
                image: DecorationImage(
  
                    image: NetworkImage('${artical['urlToImage']}'),
  
                    fit: BoxFit.cover),
  
              ),
  
            ),
  
            SizedBox(
  
              width: 15,
  
            ),
  
            Expanded(
  
              child: Container(
  
                height: 120,
  
                child: Column(
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                  mainAxisSize: MainAxisSize.min,
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  children: [
  
                    Expanded(
  
                      child: Text(
  
                        '${artical['title']}',
  
                        maxLines: 3,
  
                        overflow: TextOverflow.ellipsis,
  
                        style: Theme.of(context).textTheme.bodyText1,
  
                      ),
  
                    ),
  
                    Text(
  
                      '${artical['publishedAt']}',
  
                      style: TextStyle(color: Colors.grey),
  
                    ),
  
                  ],
  
                ),
  
              ),
  
            ),
  
          ],
  
        ),
  
      ),
);


void NavagaorToAntherPage (context,Widget widget)=>  Navigator.push(
    context,
  MaterialPageRoute(
    builder: (context)=> widget,
  ),
);


Widget BulidScrenNewsApp ()=>Center(child: CircularProgressIndicator());



void NavagatorAndFainsh (context,Widget widget)=>  Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context)=> widget,
  ),
  (route) => false,
);
 void ShowTosast ({
 required String masseg,
   required Color color,

})=> Fluttertoast.showToast(
     msg:masseg,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     backgroundColor: color,
     textColor: Colors.white,
     fontSize: 16.0
 );







