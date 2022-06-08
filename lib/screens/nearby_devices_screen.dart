import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.30,
          child: Image.asset('assets/images/Contact-Tracing.png'),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(5),
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.05,
          child: const Text(
            "Your Contacts List",
            style: TextStyle(
                fontFamily: 'Gothic',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.red),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: Image.asset('assets/images/covid19.png'),
                    title: const Text(
                      "Username",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: 'Gothic', color: Colors.teal),
                    ),
                    trailing: const Text(
                      'Healthy',
                      style:
                          TextStyle(fontFamily: 'Gothic', color: Colors.teal),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        )
      ],
    );
  }
}
