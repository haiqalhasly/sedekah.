import 'package:flutter/material.dart';

class addButton extends StatelessWidget {
  const addButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text(
              'Alhamdulillah!',
              style: TextStyle(fontSize: 20),
            ),

            duration: const Duration(milliseconds: 1500),
            width: 300.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10
                // Inner padding for SnackBar content.
                ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            action: SnackBarAction(
              label: '+0.50 Fulus',
              textColor: Colors.blue,
              onPressed: () {},
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: Icon(
          Icons.add_box,
          size: 40,
          color: const Color.fromARGB(255, 53, 111, 158),
        ));
  }
}
