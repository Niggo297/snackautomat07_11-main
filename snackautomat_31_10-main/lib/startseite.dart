import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_31_10/muenze.dart';
import 'package:snackautomat_31_10/portemonnaie.dart';
import 'package:snackautomat_31_10/provider.dart';
import 'package:snackautomat_31_10/snack_notifier.dart';
import 'widget_muenze.dart';
import 'package:state_notifier/state_notifier.dart';

class Startseite extends ConsumerWidget {
  const Startseite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackState = ref.watch(refSnackState);
    final snackNotifier = ref.read(refSnackState.notifier);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              // color: Colors.red,
              child: Column(
                children: [
                  for (final p in snackState.produkte)
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Text(p.name),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.blue,
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.monetization_on),
                      onPressed: () {
                        snackNotifier.einwerfen(Muenze(10));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.monetization_on),
                      onPressed: () {
                        snackNotifier.einwerfen(Muenze(20));
                      },
                    ),
                  ],
                ),
                Text(
                  'Einwurf: ${snackState.betragEinwurf}',
                ),
                Column(
                  children: [
                    ...baueKundenPortemonnaie(snackNotifier),
                  ],
                )
                // MuenezUI(muenze: 10, snackNotifier.einwerfen(Muenze(10)));
              ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> baueKundenPortemonnaie(SnackNotifier snackNotifier) {
    List<Muenze> muenzen = List.from(snackNotifier.getKundenSpeicher.muenzen);
    muenzen.sort((a, b) => a.wert.compareTo(b.wert));
    return muenzen.map((m) {
      return Row(
        children: [
          MuenezUI(
            muenzeWert: m.wert,
            onPressed: () => snackNotifier.einwerfen(m),
          ),
          const SizedBox(width: 8),
// toDo Anzahl berechnen
          // Text("Anzahl: $m"),
        ],
      );
    }).toList();
  }
}
