import 'package:bloc_examples/Model/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { Loading, Success, Failure }

class FavouriteAppState extends Equatable {
  List<FavouriteItemsModel> favouriteItemsList;
  List<FavouriteItemsModel> selectedItems;
  final ListStatus listStatus;
  FavouriteAppState(
      {this.selectedItems = const [],
      this.favouriteItemsList = const [],
      this.listStatus = ListStatus.Loading});

  FavouriteAppState copyWith(
      {List<FavouriteItemsModel>? favouriteItemsList,
      ListStatus? listStatus,
      List<FavouriteItemsModel>? selectedItems}) {
    return FavouriteAppState(
        selectedItems: selectedItems ?? this.selectedItems,
        favouriteItemsList: favouriteItemsList ?? this.favouriteItemsList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouriteItemsList, listStatus ,selectedItems];
}
