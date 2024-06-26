import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:wareef/Pages/tasks_list.dart';
import 'package:wareef/components/MiniCard.dart';

import '../services/task_service.dart';
import 'Detail.dart';
import 'editTask.dart';
//la page d'accueil
class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  late final controller = SlidableController(this);
  final user = FirebaseAuth.instance.currentUser!;

  List<String> usersId = [];

  Future getUsersIDs() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.docs.forEach((element) {
              usersId.add(element.reference.id);
            }));
  }

  String userPrenom = '';
  String userNom = '';
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final prenom = await getUserPrenom();
    final nom = await getUserNom();

    setState(() {
      userPrenom = prenom;
      userNom = nom;
      isLoading = false;
    });
  }

  Future<String> getUserPrenom() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('User is not authenticated');
      return 'User is not authenticated';
    }
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user.uid)
        .get();

    if (userDoc.docs.isEmpty) {
      print('User document does not exist');
      return 'User document does not exist';
    } else {
      return userDoc.docs.first.data()['prenom'] ?? 'No prenom found';
    }
  }

  Future<String> getUserNom() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('User is not authenticated');
      return 'User is not authenticated';
    }
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user.uid)
        .get();

    if (userDoc.docs.isEmpty) {
      print('User document does not exist');
      return 'User document does not exist';
    } else {
      return userDoc.docs.first.data()['nom'] ?? 'No prenom found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(
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
                            'Bonjour $userPrenom',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Bienvenue dans l'application",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 186, 131, 222),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: const Icon(
                            Icons.menu_open_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
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
                          color: const Color.fromARGB(255, 30, 30, 30),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          border: Border.all(
                            width: 1.0,
                            color: const Color.fromARGB(255, 30, 30, 30),
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
                  SizedBox(
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
                                const Text(
                                  "Fonctionnement de l'application",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 24, 24, 24),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const Text(
                                    //   "Fonctionnement",
                                    //   style: TextStyle(
                                    //       fontSize: 18, color: Colors.white),
                                    // ),
                                    const Text(
                                      "- Glissez à droite pour voir/modifier/supprimer tâches.",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(186, 255, 255, 255),
                                      ),
                                    ),
                                    
                                    const Text(
                                      "- Cliquez sur l'icône 'Démarrer' pour lancer une tâche.",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(186, 255, 255, 255),
                                      ),
                                    ),
                                    const Text(
                                      "- Cochez pour marquer une tâche comme terminée.",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(186, 255, 255, 255),
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
                                const Text(
                                  "Vos tâches pour aujourdhui",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TasksList(),
                                        ));
                                  },
                                  child: const Text(
                                    "Voir toutes",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 186, 131, 222),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                           Column(
                             children: [
                               Consumer<TaskService>(
                                 builder: (context, value, child) {
                                   return ListView.builder(
                                     shrinkWrap: true,
                                     itemCount: value.tasks.length,
                                     itemBuilder: (context, index) {
                                       return Padding(
                                         padding: const EdgeInsets.all(12.0),
                                         child: Column(
                                           children: [
                                             const SizedBox(height: 2),
                                             Slidable(
                                               key: const ValueKey(0),
                                               endActionPane: ActionPane(
                                                 motion: const ScrollMotion(),
                                                 children: [
                                                   SlidableAction(
                                                     onPressed: (context) {
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(
                                                           builder: (context) =>
                                                               Detail(task: value.tasks[index]),
                                                         ),
                                                       );
                                                     },
                                                     backgroundColor: const Color(0xFF21B7CA),
                                                     foregroundColor: Colors.white,
                                                     icon: Icons.info_outline,
                                                     label: 'Detail',
                                                   ),
                                                   SlidableAction(
                                                     onPressed: (context) {
                                                       Navigator.push(
                                                         context,
                                                         MaterialPageRoute(
                                                           builder: (context) =>
                                                               EditTask(task: value.tasks[index]),
                                                         ),
                                                       );
                                                     },
                                                     backgroundColor: const Color(0xFF0392CF),
                                                     foregroundColor: Colors.white,
                                                     icon: Icons.edit,
                                                     label: 'Modifier',
                                                   ),
                                                   SlidableAction(
                                                     onPressed: (context) {
                                                       Provider.of<TaskService>(context, listen: false)
                                                           .deleteTask(value.tasks[index].taskId);
                                                       // Afficher une notification ou un toast
                                                     },
                                                     backgroundColor: const Color(0xFFFE4A49),
                                                     foregroundColor: Colors.white,
                                                     icon: Icons.delete,
                                                     label: 'Supprimer',
                                                   ),
                                                 ],
                                               ),
                                               child: Row(
                                                 children: [
                                                   Checkbox(
                                                     value: value.tasks[index].completed,
                                                     onChanged: (bool? newValue) {
                                                       Provider.of<TaskService>(context, listen: false)
                                                           .updateTask(
                                                         value.tasks[index].copyWith(
                                                           completed: newValue ?? false,
                                                         ),
                                                       );
                                                     },
                                                   ),
                                                   Expanded(
                                                     child: MiniCard(
                                                       title: "${value.tasks[index].taskTitle}",
                                                       subtitle:
                                                       '${value.tasks[index].taskStartDate!.day} - ${value.tasks[index].taskStartDate!.month} - ${value.tasks[index].taskStartDate!.year}',
                                                       select: true,
                                                       sideColor: value.tasks[index].completed
                                                           ? Colors.green
                                                           : Colors
                                                           .yellowAccent, // Passage de la couleur sideColor
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       );
                                     },
                                   );
                                 },
                               ),
                           ]
                             ,)

,

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
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(
              0xff2F2F2F,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(
                    0xff2F2F2F,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "images/imagepeople-removebg-preview.png",
                            width: 500,
                            height: 500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "$userPrenom  $userNom",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          user.email!,
                          style: const TextStyle(
                            color: Color.fromARGB(154, 255, 255, 255),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                // decoration: BoxDecoration(color:Colors.deepPurple),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          leading: const Icon(
                            Icons.home,
                            size: 28,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'About',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          leading: const Icon(
                            Icons.info,
                            size: 28,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      leading: const Icon(
                        Icons.logout,
                        size: 28,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
