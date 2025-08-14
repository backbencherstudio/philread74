import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSelected = StateProvider<bool>((ref){
  return false;
});



final selectedIndexProvider = StateProvider<int>((ref){
  return 0;
});