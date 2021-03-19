import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_starter_app/database/home_dao.dart';
import 'package:provider_starter_app/models/item_model.dart';
import 'package:sembast/sembast.dart';

class HomeProvider extends ChangeNotifier {
  HomeDao _homeDao;
  List<Item> _inMemoryItemsList = [];
  StreamSubscription _dbSubscription;

  HomeProvider() {
    _init();
  }

  void _init() {
    _homeDao = HomeDao();
    _listenToOffersUpdates();
  }

  List<Item> get inMemoryItemsList => _inMemoryItemsList;

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

  Future<void> _listenToOffersUpdates() async {
    _dbSubscription =
        await _homeDao.listenToUpdates((List<RecordSnapshot<int, Map<String, dynamic>>> snapshots) {
      _inMemoryItemsList = HomeDao.snapshotsToItemsList(snapshots);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _dbSubscription?.cancel();
    super.dispose();
  }
}
