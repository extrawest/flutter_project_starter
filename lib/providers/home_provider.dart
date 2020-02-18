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
    await homeDao.save(item);
  }

  Future<List<Item>> getAllItems() async {
    return homeDao.getAll();
  }

  Future updateItem(Item item) async {
    homeDao.update(item);
  }

  Future deleteItem(Item item) async {
    await homeDao.delete(item);
  }
}
