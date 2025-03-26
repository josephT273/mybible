// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EachChapterButton extends StatefulWidget {
  const EachChapterButton({
    super.key,
    required this.chapter,
    required this.isSelected,
  });

  final String chapter;
  final bool isSelected;

  @override
  State<EachChapterButton> createState() => _EachChapterButtonState();
}

class _EachChapterButtonState extends State<EachChapterButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 5.0,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: theme.colorScheme.onPrimary,
        ),
        boxShadow: [
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
        child: Center(
          child: Text(
            widget.chapter,
            style: TextStyle(
              color: widget.isSelected
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.onPrimary,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
