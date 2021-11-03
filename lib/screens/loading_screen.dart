import 'package:alf_maps/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'acceso_gps_screen.dart';
import 'mapa_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator.isLocationServiceEnabled()) {
        Navigator.pushReplacement(
            context, navegarMapaFadeIn(context, const MapaScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: checkGpsAndLocation(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        }
      },
    ));
  }

  Future checkGpsAndLocation(BuildContext context) async {
    // Ver si el permiso se obtuvo
    final permisoGPS = await Permission.location.isGranted;
    // ver si gps esta activo
    final gpsActivo = await Geolocator.isLocationServiceEnabled();

    if (permisoGPS && gpsActivo) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, const MapaScreen()));
      return ' ';
    } else if (!permisoGPS) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, const AccesoGpsScreen()));
      return 'Debe dar permiso al GPS';
    } else {
      return 'Debe activar su GPS';
    }

    //

    //Navigator.pushReplacement(
    //  context, navegarMapaFadeIn(context, MapaScreen()));
  }
}
