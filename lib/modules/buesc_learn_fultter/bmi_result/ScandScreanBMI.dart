import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScendBMI extends StatelessWidget {
  final bool r;
  final int age;
  final int gender;

  ScendBMI({
    required this.r,
    required this.age,
    required this.gender,

  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( 'Resuelat Screan'),
        leading: IconButton(icon:Icon( Icons.arrow_back_sharp,),onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'gender =  ${r ? 'male' :'famle '}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40,

              ),
            ),
            Text(
              'result = ${gender} ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40,

              ),
            ),
            Text(
              'Age =  ${age}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40,

              ),
            ),
          ],

        ),
      ),

    );
  }
}
