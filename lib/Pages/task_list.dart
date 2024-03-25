import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wareef/Pages/add_task.dart';
import 'package:wareef/Pages/tasks_list.dart';
import 'package:wareef/components/mini_card.dart';
import 'package:wareef/services/task_service.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Samay SAS',
          style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
          // style: TextStyle(fontSize: 30),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 186, 131, 222),
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/image 7.png"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AddTask();
            },
          ));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 186, 131, 222),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Consumer<TaskService>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return SafeArea(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Vous avez 3 tâches à accomplir",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
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
                                      fillColor:
                                          Color.fromARGB(255, 30, 30, 30),
                                      hoverColor: Colors.transparent,
                                      hintText: "Rechercher une tâche",
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
                        height: MediaQuery.of(context).size.height - 200,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Progression",
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
                                          color: Color.fromARGB(
                                              255, 186, 131, 222),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 24, 24, 24),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Daily task",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          "2/3 task completed",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                186, 255, 255, 255),
                                          ),
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "You are almost done go ahead",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
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
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  20) /
                                              100,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 186, 131, 222),
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
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      "Voir toutes",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 186, 131, 222),
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
                                        key: const ValueKey(0),
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed:
                                                  (BuildContext context) {},
                                              backgroundColor:
                                                  const Color(0xFF21B7CA),
                                              foregroundColor: Colors.white,
                                              icon: Icons.remove_red_eye,
                                              label: 'Detail',
                                            ),
                                            SlidableAction(
                                              onPressed: (_) =>
                                                  controller.close(),
                                              backgroundColor:
                                                  const Color(0xFF0392CF),
                                              foregroundColor: Colors.white,
                                              icon: Icons.edit,
                                              label: 'Modifier',
                                            ),
                                            SlidableAction(
                                              onPressed:
                                                  (BuildContext context) {},
                                              backgroundColor:
                                                  const Color(0xFFFE4A49),
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              label: 'Supprimer',
                                            ),
                                          ],
                                        ),
                                        child: const MiniCard(
                                            title: "Examen ",
                                            subtitle: "15 Mai",
                                            select: true,
                                            sideColor :Color.fromARGB(255, 215, 240, 255))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Column(
                                  children: [
                                    MiniCard(
                                      title: "Devoir ",
                                      subtitle: "5 Mai",
                                      select: false,
                                        sideColor :Color.fromARGB(255, 215, 240, 255)
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    MiniCard(
                                      title: "Apprendre Leçon ",
                                      subtitle: "17 Mars",
                                      select: true,
                                        sideColor :Color.fromARGB(255, 215, 240, 255),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      "Voir toutes",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 186, 131, 222),
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
              ));
            },
          );
        },
      ),
    );
  }
}
