import 'package:flutter/material.dart';

class MiniCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool select;
  const MiniCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.select});

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
            trailing: !widget.select
                ? const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
          ),
        ),
        Positioned(
          child: Container(
            width: 15,
            height: 72,
            decoration: const BoxDecoration(
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
