import 'package:bloc_examples/Model/favourite_items_model.dart';
import 'package:bloc_examples/bloc/favourite_app_bloc/favourite_app_bloc.dart';
import 'package:bloc_examples/bloc/favourite_app_bloc/favourite_app_events.dart';
import 'package:bloc_examples/bloc/favourite_app_bloc/favourite_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
              builder: (context, state) {
            return Visibility(
              visible: state.selectedItems.isNotEmpty ? true : false,
              child: IconButton(
                  onPressed: () {
                    context.read<FavouriteAppBloc>().add(DeleteItem());
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          })
        ],
        title: Text("Favourite App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.Loading:
                return Center(child: CircularProgressIndicator());
              case ListStatus.Success:
                return ListView.builder(
                    itemCount: state.favouriteItemsList.length,
                    itemBuilder: (context, index) {
                      final item = state.favouriteItemsList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                              value: state.selectedItems.contains(item)
                                  ? true
                                  : false,
                              onChanged: (value) {
                                if (value!) {
                                  context
                                      .read<FavouriteAppBloc>()
                                      .add(SelectItems(item: item));
                                } else {
                                  context
                                      .read<FavouriteAppBloc>()
                                      .add(DeselectItem(item: item));
                                }
                              }),
                          title: Text(item.value.toString()),
                          trailing: IconButton(
                              onPressed: () {
                                final updatedItem = FavouriteItemsModel(
                                    id: item.id,
                                    value: item.value,
                                    isFavourite:
                                        item.isFavourite ? false : true);
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(FavouriteItem(item: updatedItem));
                              },
                              icon: item.isFavourite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_outline)),
                        ),
                      );
                    });
              case ListStatus.Failure:
                return Text("Something Went Wrong");
            }
          },
        ),
      ),
    );
  }
}
