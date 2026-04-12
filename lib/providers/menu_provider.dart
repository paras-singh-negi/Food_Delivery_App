import 'package:flutter/foundation.dart';

class MenuProvider extends ChangeNotifier {
  Map<String, dynamic>? _selectedItem;
  final Map<int, int> _itemQuantities = {};

  Map<String, dynamic>? get selectedItem => _selectedItem;

  int quantityFor(Map<String, dynamic> item) {
    final id = item['id'] is int ? item['id'] as int : -1;
    return _itemQuantities[id] ?? 0;
  }

  void selectItem(Map<String, dynamic> item) {
    _selectedItem = item;
    notifyListeners();
  }

  void addItem(Map<String, dynamic> item) {
    final id = item['id'] is int ? item['id'] as int : -1;
    final current = _itemQuantities[id] ?? 0;
    _itemQuantities[id] = current + 1;
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    final id = item['id'] is int ? item['id'] as int : -1;
    final current = _itemQuantities[id] ?? 0;
    if (current <= 1) {
      _itemQuantities.remove(id);
    } else {
      _itemQuantities[id] = current - 1;
    }
    notifyListeners();
  }
}
