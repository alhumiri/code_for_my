import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.greenAccent,
       leading:const Icon(
         Icons.account_balance_wallet_outlined,
       ) ,
       title: Text('my first app in flutter',
         textAlign: TextAlign.center,
         style: TextStyle(
           color: Colors.orange,
         ),
       ),
       actions: [
         IconButton(onPressed: (){
           print('ziad alhumir');
         }, icon: Icon(Icons.menu_open))
       ],
     ),
     body: SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Row(
         mainAxisSize:MainAxisSize.max ,
           mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
           children: [


             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),
             Text('ziad alhumiri ',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 30,
               ),
             ),

       ]),
     ),
   );
  }

}