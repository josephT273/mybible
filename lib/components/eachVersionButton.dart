// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EachVersionButton extends StatefulWidget {
  const EachVersionButton({
    super.key,
    required this.versionData,
    required this.isSelected,
  });

  final Map versionData;
  final bool isSelected;

  @override
  State<EachVersionButton> createState() => _EachVersionButtonState();
}

class _EachVersionButtonState extends State<EachVersionButton> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedColor = widget.isSelected
        ? theme.colorScheme.secondary
        : theme.colorScheme.onPrimary;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
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
      child: Column(
        children: [
          // Version ID
          Container(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 15.0,
              right: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Version ID and Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.versionData["ID"].toString(),
                      style: TextStyle(
                        color: selectedColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      widget.versionData["title"].toString(),
                      style: TextStyle(
                        color: selectedColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                // Expand / Collapse Button
                IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: Icon(
                    isExpanded ? Icons.expand_less_sharp : Icons.expand_more_sharp,
                    color: selectedColor,
                  ),
                ),
              ],
            ),
          ),
          // Version Details
          isExpanded
              ? Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    border: Border.all(
                      color: theme.dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    widget.versionData["details"].toString(),
                    style: TextStyle(
                      color: selectedColor,
                      fontSize: 14.0,
                      height: 1.4,
                    ),
                  ),
                )
              : const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
