import '../database.dart';

class MatchLocationsViewTable extends SupabaseTable<MatchLocationsViewRow> {
  @override
  String get tableName => 'match_locations_view';

  @override
  MatchLocationsViewRow createRow(Map<String, dynamic> data) =>
      MatchLocationsViewRow(data);
}

class MatchLocationsViewRow extends SupabaseDataRow {
  MatchLocationsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatchLocationsViewTable();

  int? get matchId => getField<int>('match_id');
  set matchId(int? value) => setField<int>('match_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get user1Id => getField<String>('user1_id');
  set user1Id(String? value) => setField<String>('user1_id', value);

  String? get user2Id => getField<String>('user2_id');
  set user2Id(String? value) => setField<String>('user2_id', value);

  List<String> get userIds => getListField<String>('user_ids');
  set userIds(List<String>? value) => setListField<String>('user_ids', value);

  bool? get isDeleted => getField<bool>('is_deleted');
  set isDeleted(bool? value) => setField<bool>('is_deleted', value);

  List<double> get matchLocations => getListField<double>('match_locations');
  set matchLocations(List<double>? value) =>
      setListField<double>('match_locations', value);
}
