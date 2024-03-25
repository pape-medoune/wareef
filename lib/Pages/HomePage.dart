
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:wareef/Pages/Accueil.dart';
import 'package:wareef/Pages/addTask.dart';


import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:wareef/Pages/tasks_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
 List <Widget> _screen = [
    Accueil(),
    AddTask(),
    TasksList(),
];int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold( 
      body: _screen[_selectedIndex],
     // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(
      //       30,
      //     ),
      //   ),
      //   backgroundColor: Color.fromARGB(255, 186, 131, 222),
      //   child: Icon(
      //     Icons.add,
      //     size: 30,
      //     color: Colors.white,
      //   ),
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex:
              _selectedIndex, // Assuming _selectedIndex is a variable holding the current index
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              // You can put your logic here for handling item taps
            });
          },
          height: 10,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: Icons.home,
              selectedColor: Colors.white,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: Icons.add,
              selectedColor: Colors.white,
            ),

            /// Profile
            CrystalNavigationBarItem(
              icon: Icons.task,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

 }
