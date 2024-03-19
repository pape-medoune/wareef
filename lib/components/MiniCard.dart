import 'package:flutter/material.dart';

class MiniCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool select;
  const MiniCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.select})
      : super(key: key);

  @override
  _MiniCardState createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  late String title = "";
  late String subtitle = "";
  late bool select = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            color: Color.fromARGB(255, 31, 31, 31),
          ),
          child: ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month,
                  color: const Color.fromARGB(186, 255, 255, 255),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    color: const Color.fromARGB(186, 255, 255, 255),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            trailing: !widget.select
                ? Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
          ),
        ),
        Positioned(
          child: Container(
            width: 15,
            height: 72,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 215, 240, 255),
              borderRadius: BorderRadius.only(
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
