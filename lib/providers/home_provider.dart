import 'package:flutter/material.dart';
import 'package:provider_starter_app/database/home_dao.dart';
import 'package:provider_starter_app/models/item_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeDao homeDao;

  HomeProvider() {
    _init();
  }

  void _init() {
    homeDao = HomeDao();
  }

  Future<void> insertItem(Item item) async {
    await homeDao.insertItem(item);
  }

  Future<List<Item>> getAllItems() async {
    return await homeDao.getAllItems();
  }

  Future updateItem(Item item) async {
    homeDao.updateItem(item);
  }

  Future deleteItem(Item item) async {
    await homeDao.deleteItem(item);
  }

  Future<void> insertAllItems(List<Item> itemsList) async {
    itemsList.forEach((item) async => await insertItem(item));
  }
}
