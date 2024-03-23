import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wareef/Pages/detail.dart';
import 'package:wareef/Pages/edit_task.dart';
import 'package:wareef/components/mini_card.dart';
import 'package:wareef/services/task_service.dart';
import 'package:wareef/widgets/motion_toast.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList>
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
            print(value.tasks.length);
            return ListView.builder(
              itemCount: value.tasks.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
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
                                                const Detail(),
                                          ));
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
                                                  const EditTask()));
                                    },
                                    backgroundColor: const Color(0xFF0392CF),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Modifier',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      Provider.of<TaskService>(context,
                                              listen: false)
                                          .deleteTask(
                                              value.tasks[index].taskId);
                                      displaySuccessMotionToast(context,
                                          "Tâche supprimée avec succés");
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Supprimer',
                                  ),
                                ],
                              ),
                              child: MiniCard(
                                  title: "${value.tasks[index].taskTitle}",
                                  subtitle:
                                      "${value.tasks[index].taskStartDate!.day} - ${value.tasks[index].taskStartDate!.month} - ${value.tasks[index].taskStartDate!.year}",
                                  select: true)),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ));
  }
}
