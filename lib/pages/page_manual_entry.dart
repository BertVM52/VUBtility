import 'package:flutter/material.dart';
import 'package:vubtility/constants/constants.dart';
import 'package:vubtility/theme/app_colors.dart';

class ManualEntryPage extends StatefulWidget {
  const ManualEntryPage({ Key? key }) : super(key: key);

  @override
  State<ManualEntryPage> createState() => _ManualEntryPageState();
}


class _ManualEntryPageState extends State<ManualEntryPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

        ],
      )
    );
  }
}