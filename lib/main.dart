import 'package:alf_maps/screens/acceso_gps_screen.dart';
import 'package:alf_maps/screens/loading_screen.dart';
import 'package:alf_maps/screens/mapa_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
      routes: {
        'mapa': (_) => MapaScreen(),
        'loading': (_) => LoadingScreen(),
        'acceso_gps': (_) => AccesoGpsScreen()
      },
    );
  }
}
