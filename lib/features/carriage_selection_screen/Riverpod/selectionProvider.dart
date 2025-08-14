import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSelected = StateProvider<bool>((ref){
  return false;
});



final selectedIndex = StateProvider<int>((ref){
  return 0;
});