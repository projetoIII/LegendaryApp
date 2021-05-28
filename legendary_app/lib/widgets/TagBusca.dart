import 'package:flutter/material.dart';

class TagBusca extends StatelessWidget {

  final List<String> tags;

  TagBusca({
   required this.tags
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Wrap(
          children: tags.map((tag) {
            return Container(
              margin: EdgeInsets.only(left: 10),
              child: Chip(
                label: Text(
                  tag,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color(0xFFBA68C8),
              ),
            );
          }).toList(),
        ),
    );
  }
}
