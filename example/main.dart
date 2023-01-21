import 'package:flutter/material.dart';
import 'package:flutter_view_wrapper/src/flutter_view_wrapper.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterViewWrapper(
        onRefresh: () async {},
        onWillPop: () async {
          return false;
        },
        child: const SizedBox(),
      ),
    );
  }
}
