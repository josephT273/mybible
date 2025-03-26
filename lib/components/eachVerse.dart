// ignore_for_file:, file_names

import 'package:flutter/material.dart';
import 'package:mybible/models/savedVerses.dart';

class EachVerse extends StatefulWidget {
  const EachVerse({
    super.key,
    required this.verseData,
    required this.fontSize,
    required this.eachNumberFontSize,
    required this.selectedVerse,
  });

  final Map verseData;
  final double fontSize;
  final double eachNumberFontSize;
  final List<SavedVerse> selectedVerse;

  @override
  State<EachVerse> createState() => _EachVerseState();
}

class _EachVerseState extends State<EachVerse> {
  bool isSelected = false;
  void checkSelection() {
    // Check if verse is selected or not
    bool isFound = false;
    for (SavedVerse eachSelectedVerse in widget.selectedVerse) {
      if (eachSelectedVerse.verse == widget.verseData["text"]) {
        isFound = true;
        break;
      }
    }
    isSelected = isFound;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    checkSelection();
    final selectedColor = theme.colorScheme.secondary;
    return Container(
      padding: const EdgeInsets.only(
        right: 10.0,
        top: 5.0,
        bottom: 5.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30.0,
            padding: const EdgeInsets.only(top: 3.5),
            child: Text(
              "${widget.verseData["ID"]}  ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.eachNumberFontSize,
                color: isSelected ? selectedColor : theme.colorScheme.onPrimary,
              ),
            ),
          ),
          Flexible(
            child: Text(
              "${widget.verseData["text"]}",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: widget.fontSize,
                height: 1.2,
                color: isSelected ? selectedColor : theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
