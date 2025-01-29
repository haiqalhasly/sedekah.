import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sedekah/component/amal.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void logout(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mutabaah Amal"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.coins),
            tooltip: 'Your Current Money!',
            onPressed: () {
              // handle the press
            },
          
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text("100.20"),
          ),
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(children: [
        SizedBox(height: 50),
        amalList(
          mutabaahAmalName: "Al-Quran",
        ),
        amalList(
          mutabaahAmalName: "Solat Jemaah di Masjid",
        ),
        amalList(
          mutabaahAmalName: "Sedekah",
        ),
        amalList(
          mutabaahAmalName: "Tahajud",
        ),
        amalList(
          mutabaahAmalName: "Solat Dhuha",
        ),
        amalList(
          mutabaahAmalName: "Selawat",
        ),
      ]),
    );
  }
}
