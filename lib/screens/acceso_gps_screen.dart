import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccesoGpsScreen extends StatefulWidget {
  const AccesoGpsScreen({Key? key}) : super(key: key);

  @override
  State<AccesoGpsScreen> createState() => _AccesoGpsScreenState();
}

class _AccesoGpsScreenState extends State<AccesoGpsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Debes permitirnos acceder a tu GPS para usar esta aplicación',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            MaterialButton(
              child: Text(
                'Solicitar Acceso',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              shape: const StadiumBorder(),
              splashColor: Colors.transparent,
              elevation: 0,
              onPressed: () async {
                final status = await Permission.location.request();
                accesoGPS(status);
              },
            ),
          ],
        ),
      ),
    );
  }

  void accesoGPS(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.limited:
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, 'mapa');
        break;
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.denied:
        openAppSettings();
    }
  }
}
