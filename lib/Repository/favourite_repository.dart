import 'package:bloc_examples/Model/favourite_items_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemsModel>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteItemsModel> _generateList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemsModel(id: index.toString(), value: 'Item $index'));
  }
}
