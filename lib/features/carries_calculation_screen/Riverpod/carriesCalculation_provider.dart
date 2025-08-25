import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';


final itemSizesProvider = StateProvider<Map<int, double>>((ref) {
  return {
    1: 0.96,  // bigCageSize
    2: 0.62,  // smallCageSize
    3: 0.24,  // dollySize
    4: 1.2,   // palletSize
    5: 3.02,  // totesSize
  };
});

final totalSpace = StateProvider<double>((ref){

  final bigCount = ref.watch(countController(1));
  final smallCount = ref.watch(countController(2));
  final dollyCount = ref.watch(countController(3));
  final palletCount = ref.watch(countController(4));
  final totesCount = dollyCount * 5;

  return 0.96*bigCount + 0.62*smallCount + 0.24*dollyCount + 1.2*palletCount + 3.02*totesCount;
});