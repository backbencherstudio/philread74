import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/type_carry_cost.dart';

final totalSpace = StateProvider<double>((ref){
  final bigCageSize = 0.96;
  final smallCageSize = 0.62;
  final dollySize = 0.24;
  final palletSize = 1.2;
  final totesSize = 3.02;

  final bigCount = ref.watch(countController(1));
  final smallCount = ref.watch(countController(2));
  final dollyCount = ref.watch(countController(3));
  final palletCount = ref.watch(countController(4));
  final totesCount = ref.watch(countController(5));

  return bigCageSize*bigCount + smallCageSize*smallCount + dollySize*dollyCount + palletSize*palletCount + totesSize*totesCount;
});