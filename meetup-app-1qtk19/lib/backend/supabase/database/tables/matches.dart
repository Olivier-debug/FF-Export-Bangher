import '../database.dart';

class MatchesTable extends SupabaseTable<MatchesRow> {
  @override
  String get tableName => 'matches';

  @override
  MatchesRow createRow(Map<String, dynamic> data) => MatchesRow(data);
}

class MatchesRow extends SupabaseDataRow {
  MatchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatchesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user1Id => getField<String>('user1_id');
  set user1Id(String? value) => setField<String>('user1_id', value);

  String? get user2Id => getField<String>('user2_id');
  set user2Id(String? value) => setField<String>('user2_id', value);

  List<String> get userIds => getListField<String>('user_ids');
  set userIds(List<String>? value) => setListField<String>('user_ids', value);

  bool? get isDeleted => getField<bool>('is_deleted');
  set isDeleted(bool? value) => setField<bool>('is_deleted', value);
}
