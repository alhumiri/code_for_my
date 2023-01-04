import 'dart:developer';


import 'package:flutter/material.dart';

class MassengerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fsah1-1.fna.fbcdn.net/v/t1.6435-9/117818387_729713590907520_8962198268758668364_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pk18jhhBOuAAX9MsWZM&_nc_oc=AQmxcm2Tw7vE5JZttNDx8sKXAbdfJW7Xf5gPNhohBq95nV_EqVsiGgme_lC3Mdn6CDY&_nc_ht=scontent.fsah1-1.fna&oh=00_AT92qBue6hG5VvJYVgjld9e5881bUxsJojVnQOdGZssZBQ&oe=630B84BC'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [

          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  radius: 20,

                  child: Icon(

                    Icons.camera_alt,
                    size: 20,
                  ))),
          // SizedBox(
          //   width: 10.0,
          // ),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                // backgroundColor: Colors.blue,
                  radius: 20,
                  child: Icon(
                    Icons.edit,
                    size:20 ,
                  ))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(

                decoration:BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(8),
                child: Row(

                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text('sersh'),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>bulid_state(),
    separatorBuilder:  (context,index)=>SizedBox(width: 15.0,),
    itemCount: 10,),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>bulidChat(),
                  separatorBuilder: (context,index)=>SizedBox(height: 18.0,),
                  itemCount: 15),
              




            ],
          ),
        ),
      ),
    );
  }
//  Widget bulidChat(){
// return   Row(
//   children: [
//     Stack(
//       alignment:AlignmentDirectional.bottomEnd,
//       children: [
//         CircleAvatar(
//           radius: 28.0,
//           backgroundImage: NetworkImage(
//               'https://scontent.fsah1-1.fna.fbcdn.net/v/t39.30808-6/243282526_1712710998918759_123563545691306154_n.jpg?stp=dst-jpg_p526x296&_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=qRyDX6AbmHMAX_g3uir&tn=u0-iTznImC8n1_dQ&_nc_ht=scontent.fsah1-1.fna&oh=00_AT9DHzKWJoY0lQPnInH5IVN8-m55GyNcYBxIUfqxJP-YPQ&oe=62BC9202'),
//         ),
//         Padding(
//           padding: EdgeInsetsDirectional.only(
//             bottom: 3,
//             end: 3,
//           ),
//           child: CircleAvatar(
//             radius: 8.0,
//             backgroundColor: Colors.red,
//
//           ),
//         ),
//
//       ],
//     ),
//     SizedBox(
//       width: 14,
//     ),
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'group IT ByziadAlhumiri'
//             ,
//             maxLines: 1,
//             overflow:TextOverflow.ellipsis,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16.0,
//             ),),
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   'hi how are you hi how are you are you good i am fine what about you'
//                   ,
//                   maxLines: 2,
//                   overflow:TextOverflow.ellipsis,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal:
//                 8.0),
//                 child: Container(
//                   width: 7.0,
//                   height: 7.0,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//               Text('2:14PM'),
//             ],
//           ),
//         ],
//       ),
//     ),
//
//
//   ],
// );
//   }
  //arrow function يمكن الكتابة باي شكل بس هاذا النوع افضل
  Widget bulidChat() =>Row(
    children: [
      Stack(
        alignment:AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 28.0,
            backgroundImage: NetworkImage(
                'https://scontent.fsah1-1.fna.fbcdn.net/v/t39.30808-6/243282526_1712710998918759_123563545691306154_n.jpg?stp=dst-jpg_p526x296&_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=WPTRgs6WmmQAX8Eboe-&tn=u0-iTznImC8n1_dQ&_nc_ht=scontent.fsah1-1.fna&oh=00_AT-bpoTLHl7YUsU_RyFIajQR6WycnfFvI_XTuIIpE4PezA&oe=62EA0DC2'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 3,
              end: 3,
            ),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.red,

            ),
          ),

        ],
      ),
      SizedBox(
        width: 14,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'group IT ByziadAlhumiri'
              ,
              maxLines: 1,
              overflow:TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'hi how are you hi how are you are you good i am fine what about you'
                    ,
                    maxLines: 2,
                    overflow:TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:
                  8.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text('2:14PM'),
              ],
            ),
          ],
        ),
      ),


    ],
  );
  Widget bulid_state() => Container(
    width:60 ,
    child: Column(
      children: [
        Stack(
          alignment:AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fsah1-1.fna.fbcdn.net/v/t39.30808-6/243282526_1712710998918759_123563545691306154_n.jpg?stp=dst-jpg_p526x296&_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=WPTRgs6WmmQAX8Eboe-&tn=u0-iTznImC8n1_dQ&_nc_ht=scontent.fsah1-1.fna&oh=00_AT-bpoTLHl7YUsU_RyFIajQR6WycnfFvI_XTuIIpE4PezA&oe=62EA0DC2'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,

              ),
            ),

          ],
        ),
        Text(
            'group IT ByziadAlhumiri'
            ,
            maxLines: 2,
            overflow:TextOverflow.ellipsis ),


      ],

    ),
  );
}
