import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback action;
  final Icon icon;

  ActionButton({this.action, this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: action,
          child: icon,
        ),
      ),
    ));
  }
}
