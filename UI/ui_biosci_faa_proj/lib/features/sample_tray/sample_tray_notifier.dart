import 'package:flutter_riverpod/flutter_riverpod.dart';

class Sample {
  final int position;
  final String name;
  final bool isEmpty;

  Sample({
    required this.position,
    required this.name,
    this.isEmpty = true,
  });
}

class SampleTrayNotifier extends Notifier<List<Sample>> {
  @override
  List<Sample> build() {
    // Generate 84 dummy samples
    return List.generate(84, (index) {
      final position = index + 1;
      return Sample(
        position: position,
        name: 'S$position',
        isEmpty: true, // Initially all empty
      );
    });
  }

  void updateSample(int position, String name, bool isEmpty) {
    state = [
      for (final s in state)
        if (s.position == position)
          Sample(position: position, name: name, isEmpty: isEmpty)
        else
          s,
    ];
  }
}

final sampleTrayProvider = NotifierProvider<SampleTrayNotifier, List<Sample>>(() {
  return SampleTrayNotifier();
});
