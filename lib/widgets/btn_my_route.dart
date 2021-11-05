part of 'widgets.dart';

class BtnMyRoute extends StatelessWidget {
  const BtnMyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapaBloc = BlocProvider.of<MapaBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: () {
            mapaBloc.add(OnMarcarRecorrido());
          },
        ),
      ),
    );
  }
}
