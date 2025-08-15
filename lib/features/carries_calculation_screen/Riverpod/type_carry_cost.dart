import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  return big + small + dolly + pallet + totes;
});

final countController = StateProvider.family<int, int> ((ref, id) => 0);