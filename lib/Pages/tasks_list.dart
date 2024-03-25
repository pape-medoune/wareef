// Importez les packages nécessaires
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wareef/components/mini_card.dart';
import 'package:wareef/models/task.dart';
import 'package:wareef/services/task_service.dart';
import 'package:provider/provider.dart';

import 'Detail.dart';
import 'edit_task.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  late final controller = SlidableController(this as TickerProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Samay SAS',
          // style: TextStyle(fontSize: 30),
        ),
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
      body: Consumer<TaskService>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [

                    const SizedBox(height: 12),
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
                      ), child:
                    Row(
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
                            sideColor: value.tasks[index].completed ? Colors.green : Colors.yellowAccent, // Passage de la couleur sideColor

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
    );
  }
}
