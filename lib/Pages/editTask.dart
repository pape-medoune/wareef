

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class editTask extends StatefulWidget {
  const editTask({super.key});

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {


  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body:
      SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.only(top: 45,left: 8),

          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFF028960),),
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 90), // Espacement entre l'icône et le texte
                  Text(
                    'Modification de la Tache',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60,),
              Padding(
               padding: EdgeInsets.all(0.0),
                child:
                Form(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom Tache',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Devoir mathematique',
                          hintStyle:TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                         // labelText: 'Nomm' ,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          filled: true, // Permet de remplir le fond du champ
                          fillColor: Color(0xFF1F1F1F),
                        ),

                      ),
                      SizedBox(height: 16),
                      Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'waaaaaaaaaaaa leguiiiiiii nakkkkkkkkkkkk',
                          hintStyle:TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                          //labelText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          filled: true, // Permet de remplir le fond du champ
                          fillColor: Color(0xFF1F1F1F),
                        ),
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),

                      SizedBox(height: 36),

                      Row(

                        children: [
                        Column(children: [
                          //debut
                          Text(
                            'Date Debut',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height:10,),
                          Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 30, 30, 30),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),

                            ),
                            child:  Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.calendar_today,color:  Color(0xFFFFFFFF),),
                                  onPressed: () { //issakha ta logique ici
                                  },
                                ),
                                Text(
                                  '12-03-2024',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          )
                        ],
                        ),
                      Spacer(),
                      //  SizedBox(width: 100,),
                        Column(children: [

                          //fin
                          Text(
                            'Date Fin',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height:10,),
                          Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 30, 30, 30),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),

                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.calendar_today,color: Color(0xFFFFFFFF),),
                                  onPressed: () { //issakha ta logique ici
                                  },
                                ),
                                Text(
                                  '12-03-2024',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          )
                        ],)
                      ],),

                      SizedBox(height:60),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(

                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),

                          ),
                          child: ElevatedButton(
                            onPressed: () {
                             //codeeeeeeeeee
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF028960),
                              ),
                            ),
                            child:  Text(
                              'Modifier',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              ,
            ],)
          ,),
      ) ,
    );

  }
}
