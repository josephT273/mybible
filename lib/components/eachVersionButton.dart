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
                // Version ID
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.versionData["ID"].toString(),
                      style: TextStyle(
                        color: widget.isSelected == true
                            ? Colors.greenAccent
                            : theme.colorScheme.onPrimary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      widget.versionData["title"].toString(),
                      style: TextStyle(
                        color: widget.isSelected == true
                            ? Colors.greenAccent.withOpacity(0.7)
                            : theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                // Mode Info About Versions
                IconButton(
                  onPressed: () {
                    isExpanded = !isExpanded;
                    setState(() {});
                  },
                  icon: Icon(
                    isExpanded == true
                        ? Icons.expand_less_sharp
                        : Icons.expand_more_sharp,
                    color: widget.isSelected == true
                        ? Colors.greenAccent
                        : theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          // Version Details
          isExpanded == false
              ? Container(height: 15.0)
              : Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 15.0,
                    left: 15.0,
                    right: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 19, 19),
                    border: Border.all(
                      color: Colors.grey[850]!,
                    ),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     spreadRadius: 1.0,
                    //     offset: Offset(3, 4),
                    //   )
                    // ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    widget.versionData["details"].toString(),
                    style: TextStyle(
                      color: widget.isSelected == true
                          ? Colors.greenAccent
                          : theme.colorScheme.onPrimary,
                      fontSize: 14.0,
                      height: 1.4,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
