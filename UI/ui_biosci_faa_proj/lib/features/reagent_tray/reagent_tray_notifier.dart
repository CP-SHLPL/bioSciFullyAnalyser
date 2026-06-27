import 'package:flutter_riverpod/flutter_riverpod.dart';

class Reagent {
  final int position;
  final String name;
  final bool isEmpty;

  Reagent({
    required this.position,
    required this.name,
    this.isEmpty = true,
  });
}

class ReagentTrayNotifier extends Notifier<List<Reagent>> {
  @override
  List<Reagent> build() {
    // Generate 64 dummy reagents
    return List.generate(64, (index) {
      final position = index + 1;
      return Reagent(
        position: position,
        name: 'R$position',
        isEmpty: true, // Initially all empty
      );
    });
  }

  void updateReagent(int position, String name, bool isEmpty) {
    state = [
      for (final r in state)
        if (r.position == position)
          Reagent(position: position, name: name, isEmpty: isEmpty)
        else
          r,
    ];
  }
}

final reagentTrayProvider = NotifierProvider<ReagentTrayNotifier, List<Reagent>>(() {
  return ReagentTrayNotifier();
});
