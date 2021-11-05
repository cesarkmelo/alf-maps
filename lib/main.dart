import 'package:alf_maps/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:alf_maps/screens/acceso_gps_screen.dart';
import 'package:alf_maps/screens/loading_screen.dart';
import 'package:alf_maps/screens/mapa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/mapa/mapa_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MiUbicacionBloc()),
        BlocProvider(create: (_) => MapaBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const LoadingScreen(),
        routes: {
          'mapa': (_) => const MapaScreen(),
          'loading': (_) => const LoadingScreen(),
          'acceso_gps': (_) => const AccesoGpsScreen()
        },
      ),
    );
  }
}
