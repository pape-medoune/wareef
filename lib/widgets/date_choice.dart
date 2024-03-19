import 'package:flutter/material.dart';

class DateChoice extends StatefulWidget {
  const DateChoice({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<DateChoice> createState() => _DateChoiceState();
}

class _DateChoiceState extends State<DateChoice> {
  DateTime selectedDate = DateTime.now();

  String content = "Choisir";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: widget.height * 0.8,
          child: Column(
            children: <Widget>[
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1945),
                lastDate: DateTime(2105),
                onDateChanged: (value) {
                  setState(() {
                    content = "${value.toLocal()}".split(" ")[0];
                  });
                },
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.teal),
                    child: const Text(
                      'Confirmer',
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.teal),
        child: Row(
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              content,
            ),
          ],
        ),
      ),
    );
  }
}
