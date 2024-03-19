import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wareef/components/MiniCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  late final controller = SlidableController(this);
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You have got 5 tasks ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "today to complete",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        child: Image.asset("images/image 7.png"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 30, 30, 30),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          border: Border.all(
                            width: 1.0,
                            color: Color.fromARGB(255, 30, 30, 30),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 15.0,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                initialValue: null,
                                decoration: const InputDecoration.collapsed(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 30, 30, 30),
                                  hoverColor: Colors.transparent,
                                  hintText: "Rechercher vos tâches",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onFieldSubmitted: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    // decoration: BoxDecoration(color:Colors.deepPurple,),
                    height: MediaQuery.of(context).size.height - 200,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Progression",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Voir tout",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 186, 131, 222),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 24, 24, 24),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Daily task",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      "2/3 task completed",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            186, 255, 255, 255),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "You are almost done go ahead",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                186, 255, 255, 255),
                                          ),
                                        ),
                                        Text(
                                          "66%",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                                  66) /
                                              100,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 186, 131, 222),
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Vos tâches pour aujourdhui",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Voir tout",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 186, 131, 222),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Slidable(
                                    // Specify a key if the Slidable is dismissible.
                                    key: const ValueKey(0),

                                    // The start action pane is the one at the left or the top side.
                                    // startActionPane: ActionPane(
                                    //   // A motion is a widget used to control how the pane animates.
                                    //   motion: const ScrollMotion(),

                                    //   // A pane can dismiss the Slidable.
                                    //   dismissible:
                                    //       DismissiblePane(onDismissed: () {}),

                                    //   // All actions are defined in the children parameter.
                                    //   children: [
                                    //     // A SlidableAction can have an icon and/or a label.

                                    //   ],
                                    // ),

                                    // The end action pane is the one at the right or the bottom side.
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (BuildContext context) {},
                                          backgroundColor: Color(0xFF21B7CA),
                                          foregroundColor: Colors.white,
                                          icon: Icons.remove_red_eye,
                                          label: 'Detail',
                                        ),
                                        SlidableAction(
                                          onPressed: (_) => controller.close(),
                                          backgroundColor:
                                              const Color(0xFF0392CF),
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          label: 'Modifier',
                                        ),
                                        SlidableAction(
                                          onPressed: (BuildContext context) {},
                                          backgroundColor: Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Supprimer',
                                        ),
                                      ],
                                    ),

                                    // The child of the Slidable is what the user sees when the
                                    // component is not dragged.
                                    child: MiniCard(
                                        title: "Examen ",
                                        subtitle: "15 Mai",
                                        select: true)),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                MiniCard(
                                  title: "Devoir ",
                                  subtitle: "5 Mai",
                                  select: false,
                                ),
                                const SizedBox(
                              height: 15,
                            ),
                            MiniCard(
                                  title: "Apprendre Leçon ",
                                  subtitle: "17 Mars",
                                  select: true,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Vos tâches pour demain",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Voir tout",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 186, 131, 222),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 186, 131, 222),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    //   bottomNavigationBar: SalomonBottomBar(
    //     itemPadding: EdgeInsets.symmetric(
    //       horizontal: 15,
    //       vertical: 15,
    //     ),
    //     backgroundColor: Colors.white,
    //     currentIndex: _currentIndex,
    //     onTap: (i) => setState(() => _currentIndex = i),
    //     items: [
    //       /// Home
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.home),
    //         title: Text("Accueil"),
    //         selectedColor: Colors.purple,
    //       ),

    //       /// Likes
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.task),
    //         title: Text("Tâches"),
    //         selectedColor: Colors.pink,
    //       ),

    //       /// Profile
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.person),
    //         title: Text("Profile"),
    //         selectedColor: Colors.teal,
    //       ),

    //       /// Search
    //       SalomonBottomBarItem(
    //         icon: Icon(Icons.info),
    //         title: Text("A propos"),
    //         selectedColor: Colors.orange,
    //       ),
    //     ],
    //   ),
    );
  }
}
