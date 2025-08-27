import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:philread74/features/carries_calculation_screen/Riverpod/carriesCalculation_provider.dart';

import '../../portion_selection_screen/Riverpod/portionProvider.dart';

final portionMap = {
  9: {"portion" : 0.25, "percentage": 0.10},
  18: {"portion" : 0.50, "percentage": 0.07},
  27: {"portion" : 0.75, "percentage": 0.04},
  36: {"portion" : 1.00, "percentage": 0.00},
};

final discountProvider = StateProvider<double>((ref) => 0.0);

final totalCost = StateProvider<double>((ref) {
  final inputCost = ref.watch(discountProvider);
  final data = ref.watch(valueProvider);
  final portionData = portionMap[data] ?? {"portion" : 0.25, "percentage": 0.10};

  return inputCost * (portionData["portion"] ?? 0.25) * (1 + (portionData["percentage"] ?? 0.10));
});

final itemPerCost = StateProvider.family<double, int> ((ref, id){
  final total = ref.watch(totalCost);
  final data = ref.watch(valueProvider);
  final itemSize = ref.read(itemSizesProvider);
  final itemSizeValue = itemSize[id] ?? 0.96;

  if(id == 4) return total / data;
  return (total * itemSizeValue) / data;
});