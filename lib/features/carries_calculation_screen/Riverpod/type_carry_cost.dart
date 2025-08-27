import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../portion_selection_screen/Riverpod/portionProvider.dart';
import 'carriesCalculation_provider.dart';

final bigCageCost = StateProvider<double>((ref)=> 0.0);
final smallCageCost = StateProvider<double>((ref)=> 0.0);
final dollyCost = StateProvider<double>((ref)=> 0.0);
final palletCost = StateProvider<double>((ref)=> 0.0);
final totesCost = StateProvider<double>((ref)=> 0.0);