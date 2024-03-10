import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final messages = <String>[
      "Cargando peliculas",
      "Preparando palomitas",
      "Lamando a batman",
      "Apagando luces",
      "Esto esta tardando mas de lo esperado"
    ];

    Stream<String> getLoadingMessages() {
      return Stream.periodic(const Duration(seconds: 3), (step) {
        return messages[step];
      }).take(messages.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("espere porfavor"),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: const EdgeInsets.all(48.0),
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Cargando...", style: textStyle.bodyLarge);

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
