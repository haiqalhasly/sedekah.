import 'package:flutter/material.dart';
import 'package:sedekah/component/addButton.dart';

class amalList extends StatelessWidget {
  final String mutabaahAmalName;

  const amalList({
    super.key,
    required this.mutabaahAmalName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(mutabaahAmalName), addButton()]),
          ),
        ),
      ),
    );
  }
}
