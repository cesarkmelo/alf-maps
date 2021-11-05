part of 'widgets.dart';

class BtnMyLocation extends StatelessWidget {
  const BtnMyLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapaBloc = BlocProvider.of<MapaBloc>(context);
    final miUbicacionBloc = BlocProvider.of<MiUbicacionBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.my_location,
            color: Colors.black87,
          ),
          onPressed: () {
            final destino = miUbicacionBloc.state.ubicacion;
            mapaBloc.moverCamara(destino!);
          },
        ),
      ),
    );
  }
}
