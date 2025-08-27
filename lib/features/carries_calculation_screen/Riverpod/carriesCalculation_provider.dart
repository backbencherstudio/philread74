import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';

import '../../portion_selection_screen/Riverpod/portionProvider.dart';

final countController = StateProvider.family<int, int> ((ref, id) => 0);

final readOnly = StateProvider.family<bool, double>((ref, size) {
  final maxCap = ref.watch(valueProvider);
  final totalCap = ref.watch(totalSpace);
  final restCap = (maxCap - totalCap);
  return size > restCap;
});

final itemSizesProvider = StateProvider<Map<int, double>>((ref) {
  return {
    1: 0.96,  // bigCageSize
    2: 0.62,  // smallCageSize
    3: 0.24,  // dollySize
    5: 1.2,   // totesSize
    4: 3.02,  // palletSize
  };
});

final totalSpace = StateProvider<double>((ref){

  final bigCount = ref.watch(countController(1));
  final smallCount = ref.watch(countController(2));
  final dollyCount = ref.watch(countController(3));
  final palletCount = ref.watch(countController(4));

  return 0.96*bigCount + 0.62*smallCount + 0.24*dollyCount + 3.02*palletCount;
});