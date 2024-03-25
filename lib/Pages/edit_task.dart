import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:wareef/models/task.dart';
import 'package:wareef/services/task_service.dart';
import 'package:wareef/widgets/date_choice.dart';

import '../widgets/motion_toast.dart';

class EditTask extends StatefulWidget {
  final Task task;

  const EditTask({Key? key, required this.task}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();
  final ValueNotifier<DateTime> _taskStartDateNotifier =
      ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<DateTime> _taskEndDateNotifier =
      ValueNotifier<DateTime>(DateTime.now());

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {

        await context.read<TaskService>().updateTask(Task(
          taskId: widget.task.taskId,
          taskTitle: _taskNameController.text.trim(),
          taskDescription: _taskDescriptionController.text.trim(),
          taskStartDate: _taskStartDateNotifier.value,
          taskEndDate: _taskEndDateNotifier.value,
        ));

        MotionToast.success(
          title: Text("Succès"),
          description: Text("Tâche mise à jour avec succès"),
        ).show(context);
      } catch (e) {

        MotionToast.error(
          title: Text("Erreur"),
          description: Text("Une erreur s'est produite lors de la mise à jour de la tâche"),
        ).show(context);
      }
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/Group 21.png",
                color: Colors.white,
              ),
            ),
            const Text(
              "Modifier la tâche",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Container(),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 2, 137, 96),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<TaskService>(
        builder: (context, value, child) => SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) => SingleChildScrollView(

              child: Column(
                children: [
                  Form(
                    // key: _formKey,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        // child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  // height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromARGB(255, 31, 31, 31),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 3,
                                  ),
                                  child: TextFormField(
                                    controller: _taskNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Ce champs est obligatoire";
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      hintText: "${widget.task.taskTitle}" ,
                                      label: Text(
                                        'Nom',

                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 31, 31, 31),
                                        ),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 31, 31, 31),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromARGB(255, 31, 31, 31),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 3,
                                  ),
                                  child: TextFormField(
                                    controller: _taskDescriptionController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Ce champ est obligatoire";
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      hintText:  "${widget.task.taskDescription}",
                                      label: Text(
                                        "Description",

                                        //"${value.tasks[index].taskDescription}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 31, 31, 31),
                                        ),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 31, 31, 31),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 36),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    //debut
                                    const Text(
                                      'Date Debut',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // width: 180,
                                      // height: 50,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 30, 30, 30),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: DateChoice(
                                          selectedDate: _taskStartDateNotifier,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              290),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                //  SizedBox(width: 100,),
                                Column(
                                  children: [
                                    //fin
                                    const Text(
                                      'Date Fin',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      // width: 180,
                                      // height: 50,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 30, 30, 30),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: DateChoice(
                                          selectedDate: _taskEndDateNotifier,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              290),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 60),
                            GestureDetector(
                              onTap: _submit,
                              child: Container(
                                width: double.infinity,
                                // height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromARGB(255, 2, 137, 96),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 16,
                                ),
                                child: const Text(
                                  "Modifier la tâche",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
