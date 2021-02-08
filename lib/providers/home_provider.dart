import 'package:flutter/material.dart';
import 'package:provider_starter_app/database/home_dao.dart';
import 'package:provider_starter_app/models/item_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeDao _homeDao;

  HomeProvider() {
    _init();
  }

  void _init() {
    _homeDao = HomeDao();
  }

  Future<void> insertItem(Item item) async {
    await _homeDao.save(item);
  }

  Future<List<Item>> getAllItems() async {
    return _homeDao.getAll();
  }

  Future<void> updateItem(Item item) async {
    await _homeDao.update(item);
  }

  Future<void> deleteItem(Item item) async {
    await _homeDao.delete(item);
  }
}
