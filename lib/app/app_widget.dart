import 'package:coffee_shop_website_design/app/shared/utils/snackbar/global_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Coffee Shop Website',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.roboto().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Scaffold(
        key: GlobalScaffold.instance.scafoldKey,
        body: child,
        resizeToAvoidBottomInset: false,
      ),
    ).modular();
  }
}