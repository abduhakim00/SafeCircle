// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_app/providers/user_info.dart';

class UserProfile extends StatelessWidget {
  Widget _builder(ctx, field, prop, [change]) {
    return SizedBox(
      height: MediaQuery.of(ctx).size.height * 0.09,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        minLeadingWidth: 130,
        leading: Text(
          field,
          style: const TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: 'Gothic',
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal),
        ),
        title: Text(
          prop.toString(),
          style: const TextStyle(
              // fontFamily: 'Gothic',
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        trailing:
            change != null ? const InkWell(child: Icon(Icons.edit)) : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<UserData>(context, listen: false).getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("SafeCircle"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              "You are healthy!",
              style: TextStyle(
                  fontFamily: 'Gothic',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Column(
            children: [
              _builder(context, "Username:", info.data()['username']),
              const Divider(),
              _builder(
                  context, "Email:", FirebaseAuth.instance.currentUser.email),
              const Divider(),
              _builder(context, "Covid Status:",
                  info.data()["Covid"] == 1 ? 'Healthy' : 'Sick'),
              const Divider(),
              _builder(
                  context,
                  "BMI:",
                  info.data()['BMI'] == 0
                      ? "Null, Measure it!"
                      : info.data()['BMI'],
                  1),
              const Divider(),
              _builder(
                  context,
                  "Diabetes Risk:",
                  info.data()['Diabetes'] == 0
                      ? "Null, Measure it!"
                      : info.data()['Diabetes'],
                  1),
            ],
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            child: const Text(
              "Incase of Emergency call: \n0533 859 73 48",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.teal,
                  fontFamily: "Gothic",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
