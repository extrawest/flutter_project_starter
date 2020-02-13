import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_starter_app/database/app_database.dart';
import 'package:provider_starter_app/database/home_dao.dart';
import 'package:provider_starter_app/models/item_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AppDatabase.isTestingMode = true;
  defineTests();
}

void defineTests() {
  group('database tests', () {

    const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return ".";
    });

    HomeDao homeDao;

    setUp(() async {
      homeDao = HomeDao();
    });

    test('save/get', () async {
      var item = Item(id: 0, name: "itemName");
      await homeDao.save(item);
      expect(await homeDao.get(1), isNull);
      expect(await homeDao.get(0), isNotNull);
      expect((await homeDao.get(0)).id, item.id);
      expect((await homeDao.get(0)).name, item.name);
    });

    test('delete', () async {
      var item = Item(id: 0, name: "itemName");
      await homeDao.delete(item);
      expect(await homeDao.get(0), isNull);
    });

    test('save/update', () async {
      var item = Item(id: 0, name: "itemName");
      await homeDao.save(item);
      expect(await homeDao.get(0), isNotNull);
      await homeDao.update(Item(id: 0, name: "itemNameUpdated"));
      expect(await homeDao.get(0), isNotNull);
      expect((await homeDao.get(0)).name, "itemNameUpdated");
    });

    test('getAll', () async {
      var item = Item(id: 0, name: "itemName");
      var item1 = Item(id: 1, name: "itemName1");
      var item2 = Item(id: 2, name: "itemName2");
      await homeDao.save(item);
      await homeDao.save(item1);
      await homeDao.save(item2);
      expect(await homeDao.get(0), isNotNull);
      List<Item> itemsList = await homeDao.getAll();
      expect(itemsList, isNotEmpty);
      expect(itemsList.length, 3);
      expect(itemsList[0].id, item.id);
    });

    test('clearStore', () async {
      var item = Item(id: 10, name: "itemName");
      await homeDao.save(item);
      expect(await homeDao.get(10), isNotNull);
      await homeDao.clearStore();
      expect(await homeDao.get(10), isNull);
      expect((await homeDao.getAll()).length, 0);
    });

    tearDown(() async {
      await homeDao.clearStore();
      AppDatabase.isTestingMode = false;
    });

  });
}
