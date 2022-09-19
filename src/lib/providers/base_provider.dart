import '../services/models.dart';
import 'my_database.dart';
import 'package:path/path.dart';

abstract class BaseProvider<T extends BaseModel> {
  static MyDatabase? _db;
  final String tableName;

  BaseProvider(this.tableName);

  Future<int> insert(T entity) async {
    return (await MyDatabase.connection()).insert(tableName, entity.toJson());
  }
}
