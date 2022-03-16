import 'package:flutter/material.dart';
import 'package:vubtility/constants/constants.dart';
import 'package:vubtility/soap/soap_test.dart';
import 'package:vubtility/theme/app_colors.dart';

class ManualEntryPage extends StatefulWidget {
  const ManualEntryPage({ Key? key }) : super(key: key);

  @override
  State<ManualEntryPage> createState() => _ManualEntryPageState();
}


class _ManualEntryPageState extends State<ManualEntryPage> {

  bool loading = true;
  List<String>? soapResponse;

  @override
  void initState() {
    super.initState();

    Soap soapClient = Soap();
    Future<void>.delayed(Duration.zero, () async {
      soapResponse = await soapClient.doSoapRequest();
      print('soapResponse: $soapResponse');
      if(mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: secondaryColor,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: loading
      ? loadingWidget()
      : Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            for (final String s in soapResponse!) Container(width: MediaQuery.of(context).size.width, height: 30, child: Text(s))
          ],
        ),
      )
    );
  }
}