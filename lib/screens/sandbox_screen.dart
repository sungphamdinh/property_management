import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_management/data/users_firestore.dart';
import 'package:property_management/providers/providers.dart';
import 'package:provider/provider.dart';

class SandboxScreen extends StatefulWidget {
  @override
  _SandboxScreenState createState() => _SandboxScreenState();
}

class _SandboxScreenState extends State<SandboxScreen> {
  @override
  void initState() {
    super.initState();
    //getData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  void getData() async {
    Provider.of<Users>(context).getFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sanbox"),
      ),
    );
  }
}
