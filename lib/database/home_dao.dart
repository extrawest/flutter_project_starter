import 'package:provider_starter_app/database/app_database.dart';
import 'package:provider_starter_app/models/item_model.dart';
import 'package:sembast/sembast.dart';

class HomeDao {
  static const String HOME_STORE = 'home_store';

  final _homeStore = intMapStoreFactory.store(HOME_STORE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future clearArtStore() async {
    await _homeStore.delete(await _db);
  }

  Future insertItem(Item model) async {
    await _homeStore.record(model.id).put(await _db, model.toJson());
  }

  Future<List<Item>> getAllItems() async {
    final recordSnapshots = await _homeStore.find(await _db);

    return recordSnapshots.map((snapshot) => Item.fromJson(snapshot.value)).toList();
  }

  Future updateItem(Item model) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    await _homeStore.update(await _db, model.toJson(), finder: finder);
  }

  Future deleteItem(Item model) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    await _homeStore.delete(await _db, finder: finder);
  }

  Future<void> insertAllItems(List<Item> itemsList) async {
    itemsList.forEach((item) async => await insertItem(item));
  }
}
