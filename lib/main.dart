import 'package:alf_maps/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:alf_maps/screens/acceso_gps_screen.dart';
import 'package:alf_maps/screens/loading_screen.dart';
import 'package:alf_maps/screens/mapa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/mapa/mapa_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        home: LoadingScreen(),
        routes: {
          'mapa': (_) => MapaScreen(),
          'loading': (_) => LoadingScreen(),
          'acceso_gps': (_) => AccesoGpsScreen()
        },
      ),
    );
  }
}
