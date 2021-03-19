import 'dart:async';

import 'package:provider_starter_app/database/app_database.dart';
import 'package:provider_starter_app/database/dao_api.dart';
import 'package:provider_starter_app/models/item_model.dart';
import 'package:sembast/sembast.dart';

class HomeDao implements DaoApi<Item> {
  static const String homeStore = 'home_store';

  final _homeStore = intMapStoreFactory.store(homeStore);

  Future<Database> get _db async => AppDatabase.instance.database;

  Future clearArtStore() async {}

  @override
  Future<void> delete(Item model) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    await _homeStore.delete(await _db, finder: finder);
  }

  @override
  Future<Item> get(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    final RecordSnapshot recordSnapshot = await _homeStore.findFirst(await _db, finder: finder);
    return recordSnapshot != null
        ? Item.fromJson(recordSnapshot?.value as Map<String, dynamic>)
        : null;
  }

  @override
  Future<List<Item>> getAll() async {
    final recordSnapshots = await _homeStore.find(await _db);
    return recordSnapshots.map((snapshot) => Item.fromJson(snapshot.value)).toList();
  }

  @override
  Future<void> save(Item model) async {
    await _homeStore.record(model.id).put(await _db, model.toJson());
  }

  @override
  Future<void> update(Item model) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    await _homeStore.update(await _db, model.toJson(), finder: finder);
  }

  @override
  Future<void> clearStore() async {
    await _homeStore.delete(await _db);
  }

  /// The data type in [onDataChanged] functions should match the type of the [_homeStore]
  /// In our case we [_homeStore] is [intMapStoreFactory], so one element of the resulting list
  /// should be RecordSnapshot<int, Map<String, dynamic>>
  Future<StreamSubscription> listenToUpdates(
      Function(List<RecordSnapshot<int, Map<String, dynamic>>>) onDataChanged) async {
    final db = await _db;
    final query = _homeStore.query();
    final subscription = query.onSnapshots(db).listen((snapshots) {
      // snapshots always contains the list of records matching the query
      onDataChanged(snapshots);
    });

    return subscription;
  }

  static List<Item> snapshotsToItemsList(
      List<RecordSnapshot<int, Map<String, dynamic>>> snapshots) {
    return snapshots.map((snapshot) => Item.fromJson(snapshot.value)).toList();
  }
}
