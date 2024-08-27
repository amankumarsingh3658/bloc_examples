import 'package:bloc_examples/Model/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvents extends Equatable {
  FavouriteAppEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvents {}

class FavouriteItem extends FavouriteAppEvents {
  final FavouriteItemsModel item;
  FavouriteItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class SelectItems extends FavouriteAppEvents {
  final FavouriteItemsModel item;

  SelectItems({required this.item});
  @override
  List<Object?> get props => [item];
}

class DeselectItem extends FavouriteAppEvents {
  final FavouriteItemsModel item;
  DeselectItem({required this.item});
  @override
  List<Object?> get props => [item];
}

class DeleteItem extends FavouriteAppEvents {
  
}