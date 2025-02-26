import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_data_source.dart';

class LocalDataSourceImp implements LocalDataSource {

  Future<BoxCollection> getCollection() async{
    Directory path = await getApplicationCacheDirectory();

    final collection = await BoxCollection.open(
      'News', // Name of your database
      {'sources'}, // Names of your boxes
      path: path.path, // Path where to store your boxes (Only used in Flutter / Dart IO)
      // Key to encrypt your boxes (Only used in Flutter / Dart IO)
    );
    return collection;
  }

  @override
  Future<Map<dynamic, dynamic>?> getData() async {
    var collection = await getCollection();
    var box = await collection.openBox<Map>('sources');
    var data = await box.get('sourceData');
    collection.close();
    return data;
  }

  @override
  Future<void> saveData(Map data) async{
   var collection = await getCollection();
   var box = await collection.openBox<Map>('sources');
   await box.put('sourceData', data);
   collection.close();
  }

}