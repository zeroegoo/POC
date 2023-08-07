import 'dart:io';

import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});
  @override
  State<StatefulWidget> createState() => _test();
}

class _test extends State<test>
    with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor:
    //       Color.fromRGBO(222, 234, 244, 1.0), // Set your desired color here
    // ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}
