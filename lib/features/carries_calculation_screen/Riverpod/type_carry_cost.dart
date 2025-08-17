import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../portion_selection_screen/Riverpod/portionProvider.dart';
import 'carriesCalculation_provider.dart';

final bigCageCost = StateProvider<double>((ref)=> 0.0);
final smallCageCost = StateProvider<double>((ref)=> 0.0);
final dollyCost = StateProvider<double>((ref)=> 0.0);
final palletCost = StateProvider<double>((ref)=> 0.0);
final totesCost = StateProvider<double>((ref)=> 0.0);

final totalCost = StateProvider<double>((ref) {
  final big = ref.watch(bigCageCost);
  final small = ref.watch(smallCageCost);
  final dolly = ref.watch(dollyCost);
  final pallet = ref.watch(palletCost);
  final totes = ref.watch(totesCost);

  final bigCount = ref.watch(countController(1));
  final smallCount = ref.watch(countController(2));
  final dollyCount = ref.watch(countController(3));
  final palletCount = ref.watch(countController(4));
  final totesCount = ref.watch(countController(5));

  return big * bigCount + small * smallCount + dolly * dollyCount + pallet * palletCount + totes * totesCount;
});

final countController = StateProvider.family<int, int> ((ref, id) => 0);

final readOnly = StateProvider.family<bool, double>((ref, size) {
  final maxCap = ref.watch(valueProvider) ?? 9.00;
  final totalCap = ref.watch(totalSpace);
  final restCap = (maxCap - totalCap);
  return size > restCap;
});