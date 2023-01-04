import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/stylses/steles.dart';
import 'package:alhumiri_frist_project/modules/shope_app/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingHome  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  color: Colors.grey[350],
                  child: Text(
                    'My Account',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20,

                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              Expanded(
                child: Container(
                  color: Colors.grey[350],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border_rounded,color: defultColor,),
                                SizedBox(width: 15,),
                                Text('WishList',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1,),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                                children: [
                                  Icon(Icons.place,color: defultColor,),
                                  SizedBox(width: 15,),
                                  Text('Addresses',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1,),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: InkWell(
                            onTap: (){
                              NavagaorToAntherPage(context, SettingsScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Icon(Icons.account_circle_sharp,color: defultColor,),
                                  SizedBox(width: 15,),
                                  Text('ProoFile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
                Container(
                  height: 60,
                  color: Colors.grey[350],
                  child: Text(
                    'Setting',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20,

                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[350],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Icon(Icons.dark_mode_outlined,color: defultColor,),
                                  SizedBox(width: 15,),
                                  Text('Dark Mode',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1,),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Icon(Icons.countertops_outlined,color: defultColor,),
                                  SizedBox(width: 15,),
                                  Text('Country',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1,),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Icon(Icons.language,color: defultColor,),
                                  SizedBox(width: 15,),
                                  Text('Language',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.grey[350],
                  alignment: Alignment.centerLeft,
                ),






              ],
          ),
        ),

        // Expanded(
        //   child: Container(
        //     color: Colors.white,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //           flex: 1,
        //           child: Text(
        //             'My Account',
        //             style: TextStyle(
        //               color: Colors.grey[800],
        //               fontSize: 20,
        //
        //             ),
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //         Expanded(
        //           flex: 1,
        //           child: Padding(
        //             padding: const EdgeInsets.all(20.0),
        //             child: Row(
        //               children: [
        //                 Icon(Icons.favorite_border_rounded,color: defultColor,),
        //                 SizedBox(width: 15,),
        //                 Text('WishList',
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black87,
        //                   ),),
        //                 Spacer(),
        //                 Icon(Icons.arrow_forward_ios_rounded),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Expanded(
        //           flex: 1,
        //           child: Padding(
        //             padding: const EdgeInsets.all(20.0),
        //             child: Row(
        //               children: [
        //                 Icon(Icons.favorite_border_rounded,color: defultColor,),
        //                 SizedBox(width: 15,),
        //                 Text('WishList',
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black87,
        //                   ),),
        //                 Spacer(),
        //                 Icon(Icons.arrow_forward_ios_rounded),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Expanded(
        //           flex: 1,
        //           child: Padding(
        //             padding: const EdgeInsets.all(20.0),
        //             child: Row(
        //               children: [
        //                 Icon(Icons.favorite_border_rounded,color: defultColor,),
        //                 SizedBox(width: 15,),
        //                 Text('WishList',
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black87,
        //                   ),),
        //                 Spacer(),
        //                 Icon(Icons.arrow_forward_ios_rounded),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //
        //
        //       ],
        //     ),
        //   ),
        // ),




      ],
    );
  }
}
