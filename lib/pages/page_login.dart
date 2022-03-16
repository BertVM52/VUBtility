import 'package:flutter/material.dart';
import 'package:vubtility/constants/constants.dart';
import 'package:vubtility/pages/page_calendar.dart';
import 'package:vubtility/pages/page_manual_entry.dart';
import 'package:vubtility/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget loginPageTitleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
            image: const AssetImage('assets/vub_logo_outlined.png'),
            width: 100,
            height: 100,
            color: Theme.of(context).primaryTextTheme.bodyText1?.color
        ),

        sizedBoxHeight,

        const Text('Lessenrooster', style: TextStyle(fontWeight: FontWeight.w600)),
        const Text('Academiejaar 2021 - 2022', style: TextStyle(fontWeight: FontWeight.w300))
      ],
    );
  }

  Column inputFields() {
    return Column(
      children: <Widget>[
        usernameField(),
        const SizedBox(height: defaultPadding*2),
        passwordField()
      ],
    );
  }

  Widget usernameField() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding*2),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: primaryColor.withOpacity(0.1),
            hintText: 'Username...',
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            contentPadding: const EdgeInsets.only(left: defaultPadding)
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding*2),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: primaryColor.withOpacity(0.1),
            hintText: 'Password...',
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            contentPadding: const EdgeInsets.only(left: defaultPadding)
        ),
      ),
    );
  }

  Widget loginButton() {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
      onTap: () => Navigator.of(context).push(MaterialPageRoute<CalendarPage>(builder: (BuildContext context) => const CalendarPage())),
      child: Container(
        width: 150,
        height: 36,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              secondaryColor.withOpacity(0.6),
              secondaryColor.withOpacity(0.6),
              secondaryColor.withOpacity(0.2)
            ],
          ),
          border: Border.all(color: secondaryColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(defaultPadding))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LOG IN', style: Theme.of(context).primaryTextTheme.bodyText1?.copyWith(fontSize: 14)),
            sizedBoxWidth,
            const Icon(Icons.arrow_forward_ios_rounded, size: 14)
          ]
        )
      )
    );
  }

  Widget skipButton() {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute<CalendarPage>(builder: (BuildContext context) => const ManualEntryPage())),
      child: const Text('skip for now',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline
        )
      ),
    );
  }

  Widget appVersionWidget() {
    return const Text('v$appVersion', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        loginPageTitleWidget(),

        inputFields(),

        Column(
            children: <Widget>[
              loginButton(),
              sizedBoxHeight,
              skipButton()
            ]
        ),

        appVersionWidget()

      ],
    );
  }
}