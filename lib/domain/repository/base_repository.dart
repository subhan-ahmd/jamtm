abstract class BaseRepository<TInsert, TRead, TOrderBy> {
  Future<int> insert(TInsert entity);
  Future<List<TRead>> getAll();
  Future<TRead?> getById(int id);
  Future<int> update(int id, TInsert entity);
  Future<int> delete(int id);
  Future<int> deleteAll();
  Future<List<TRead>> getAllOrdered({required TOrderBy orderBy, bool descending = false});
}