import 'package:flutter/material.dart';
import 'package:wareef/widgets/motion_toast.dart';

class MiniCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool select;
  final Color sideColor;
  const MiniCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.select,
      required this.sideColor,
      });

  @override
  _MiniCardState createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  late String title = "";
  late String subtitle = "";
  late bool select = true;
  Icon _iconCheck = const Icon(
    Icons.play_arrow,
    color: Colors.white,
  );
  Color _sideColor =  Colors.red;
  bool _terminated = false;

  void _marquedAsTerminated() {
    setState(() {
      if (_terminated) {
        _iconCheck = const Icon(Icons.play_arrow, color: Colors.white);
        _terminated = false;
        _sideColor = const Color.fromARGB(255, 215, 240, 255);
      } else {
        _iconCheck = const Icon(Icons.stop, color: Colors.deepPurpleAccent);
        _terminated = true;
        _sideColor = Colors.deepPurpleAccent;
        displaySuccessMotionToast(
            context, " Vous avez demaré une tâche");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            color: const Color.fromARGB(255, 31, 31, 31),
          ),
          child: ListTile(
              title: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Color.fromARGB(186, 255, 255, 255),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      color: Color.fromARGB(186, 255, 255, 255),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: _marquedAsTerminated,
                icon: _iconCheck,
              )
              ),
        ),
        Positioned(
          child: Container(
            width: 15,
            height: 72,
            decoration: BoxDecoration(
              color: _terminated ? _sideColor : widget.sideColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
