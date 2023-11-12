import 'package:flutter/material.dart';

class AvaibleSize extends StatefulWidget {
  final String size;
  const AvaibleSize({super.key, required this.size});

  @override
  State<AvaibleSize> createState() => _AvaibleSizeState();
}

class _AvaibleSizeState extends State<AvaibleSize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          isSelected = !isSelected;
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          width: 40,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.red),
          ),
          child: Text(
            widget.size,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}
