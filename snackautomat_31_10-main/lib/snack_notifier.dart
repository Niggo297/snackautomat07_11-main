import 'package:snackautomat_31_10/muenze.dart';
import 'package:snackautomat_31_10/portemonnaie.dart';
import 'package:snackautomat_31_10/produkt.dart';

import 'snack_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SnackNotifier extends StateNotifier<SnackState> {
  SnackNotifier()
      : super(SnackState(
          produkte: Produkt.startbestand,
        ));

  Portemonnaie get getKundenSpeicher => state.kundenSpeicher;

  void einwerfen(Muenze muenze) {
    final vorher = state.einwurf.muenzen;
    final nachher = [...vorher, muenze];
    final newState = state.copyWith(
      einwurf: () => Portemonnaie(
        nachher,
      ),
    );
    state = newState;
  }
}
