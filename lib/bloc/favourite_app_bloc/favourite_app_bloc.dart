import 'package:bloc_examples/Model/favourite_items_model.dart';
import 'package:bloc_examples/Repository/favourite_repository.dart';
import 'package:bloc_examples/bloc/favourite_app_bloc/favourite_app_events.dart';
import 'package:bloc_examples/bloc/favourite_app_bloc/favourite_app_state.dart';
import 'package:bloc_examples/bloc/switch_bloc/switch_events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvents, FavouriteAppState> {
  List<FavouriteItemsModel> favouriteList = [];
  List<FavouriteItemsModel> tempList = [];
  FavouriteRepository favouriteRepository;
  FavouriteAppBloc(this.favouriteRepository) : super(FavouriteAppState()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addfavouriteItem);
    on<SelectItems>(_selectItems);
    on<DeselectItem>(_deselectItems);
    on<DeleteItem>(_deleteItems);
  }
  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteAppState> emit) async {
    favouriteList = await favouriteRepository.fetchItems();
    emit(state.copyWith(
        favouriteItemsList: List.from(favouriteList),
        listStatus: ListStatus.Success));
  }

  void _addfavouriteItem(FavouriteItem event, Emitter<FavouriteAppState> emit) {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isFavourite) {
      if (tempList.contains(favouriteList[index])) {
        tempList.remove(favouriteList[index]);
        tempList.add(event.item);
      }
    } else {
      if (tempList.contains(favouriteList[index])) {
        tempList.remove(favouriteList[index]);
        tempList.add(event.item);
      }
    }

    favouriteList[index] = event.item;
    emit(state.copyWith(
        favouriteItemsList: List.from(favouriteList),
        selectedItems: List.from(tempList)));
  }

  void _selectItems(SelectItems event, Emitter<FavouriteAppState> emit) {
    tempList.add(event.item);
    emit(state.copyWith(selectedItems: List.from(tempList)));
  }

  void _deselectItems(DeselectItem event, Emitter<FavouriteAppState> emit) {
    tempList.remove(event.item);
    emit(state.copyWith(selectedItems: List.from(tempList)));
  }

  void _deleteItems(DeleteItem event, Emitter<FavouriteAppState> emit) {
    for (int i = 0; i < tempList.length; i++) {
      favouriteList.remove(tempList[i]);
    }
    tempList.clear();
    emit(state.copyWith(
        selectedItems: List.from(tempList),
        favouriteItemsList: List.from(favouriteList)));
  }
}
