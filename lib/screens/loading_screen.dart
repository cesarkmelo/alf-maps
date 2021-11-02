import 'package:alf_maps/helpers/helpers.dart';
import 'package:alf_maps/screens/acceso_gps_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: checkGpsAndLocation(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        );
      },
    ));
  }

  Future checkGpsAndLocation(BuildContext context) async {
    await Future.delayed(
      Duration(milliseconds: 1000),
    );

    Navigator.pushReplacement(
        context, navegarMapaFadeIn(context, const AccesoGpsScreen()));

    //Navigator.pushReplacement(
    //  context, navegarMapaFadeIn(context, MapaScreen()));
  }
}
