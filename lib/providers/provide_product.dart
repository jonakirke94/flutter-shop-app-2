import 'package:flutter/foundation.dart';

class ProvideProduct with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  ProvideProduct({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });
}
