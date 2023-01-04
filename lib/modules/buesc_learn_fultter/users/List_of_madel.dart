import 'package:alhumiri_frist_project/model/users/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class list_model extends StatelessWidget {

List<My_model>myname=[
  My_model(
    1,'ziad alhumiri',
    '777749860',
  ),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'user'
        ),
        titleSpacing: 20.0,

      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>Build_body(myname[0]),
          separatorBuilder: (context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 25,
            ),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          itemCount:20)

    );
  }
  Widget Build_body(My_model mod)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(

      children: [
        CircleAvatar(
          radius: 25,
          child: Text(
            mod.id.toString(),
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mod.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${mod.phon}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

            ],
          ),
        ),
      ],
    ),
  );
}
