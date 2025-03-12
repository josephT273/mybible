// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EachTestament extends StatefulWidget {
  const EachTestament({
    super.key,
    required this.english,
    required this.amharic,
    required this.selectedTestament,
    required this.setSelectedTestament,
  });

  final String english;
  final String amharic;
  final String selectedTestament;
  final Function setSelectedTestament;

  @override
  State<EachTestament> createState() => _EachTestamentState();
}

class _EachTestamentState extends State<EachTestament> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        widget.setSelectedTestament(widget.english);
        setState(() {});
      },
      child: Container(
        width: 200.0,
        margin: const EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 5.0,
        ),
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
          left: 20.0,
          right: 20.0,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          border: Border.all(
            color: theme.colorScheme.onPrimary,
          ),
          boxShadow:  [
            BoxShadow(
              color: theme.colorScheme.onPrimary,
              spreadRadius: 1.0,
              offset: const Offset(3, 4),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.english,
                style: TextStyle(
                    fontSize: 18.0,
                    color: widget.selectedTestament == widget.english
                        ? Colors.greenAccent
                        : theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5.0),
              Text(
                widget.amharic,
                style: TextStyle(
                    fontSize: 16.0,
                    color: widget.selectedTestament == widget.english
                        ? Colors.greenAccent
                        : theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
