import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/ScandScreanBMI.dart';


class Bmi extends StatefulWidget {



  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  bool ismale=true;
  int age=20;
  double height=120;
  int wighth=50;
  double reslt =0;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''
            'BMI calculator'),

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
           children: [
               Expanded(
                 child: GestureDetector(
                   onTap: (){
                     setState(() {
                       ismale=true;
                     });
                   },
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: ismale ? Colors.blue: Colors.grey[400],
                     ),
                     child: Column(
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: [
                         // Image(image:AssetImage(' ../../../assets/images/M.png',) ,
                         //   height: 90,
                         //   width: 90,),
                         Icon(Icons.account_balance,
                         size: 80,),
                         SizedBox(
                           height: 15,
                         ),
                         Text('MALL',
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                         ),),
                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 width: 20,
               ),
             Expanded(
               child: GestureDetector(
                 onTap: (){
                   setState(() {
                     ismale=false;
                   });
                 },
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: !ismale ? Colors.blue: Colors.grey[400],
                   ),
                   child: Column(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children: [
                       Icon(Icons.account_balance,
                         size: 80,),
                       SizedBox(
                         height: 15,
                       ),
                       Text('female',
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                         ),),

                     ],
                   ),
                 ),
               ),
             ),

           ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline:TextBaseline.alphabetic ,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),),
                        SizedBox(
                          width: 10,
                        ),
                        Text('CM',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                    Slider(value: height,
                        max: 180,
                        min: 80,
                        onChanged: (value){
                  setState(() {
                    height=value;
                  });

          })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [

                          Text('AGE',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text('${age}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),),
                              FloatingActionButton(onPressed: (){
                                setState(() {age--; });

                              },
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text('wighth',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text('${wighth}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  wighth++;
                                });
                              },
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  wighth--;
                                });
                              },
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.blue,
            child: MaterialButton(onPressed: (){
              reslt=wighth /pow(height/100,2);
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> ScendBMI(
                gender: reslt.round(),
                age: age,
                r: ismale,
              ),),);
            },child: Text(
              'calculator',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),),
          ),
        ],
      ),

    );
  }
}
