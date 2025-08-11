import '../database.dart';

class SwipesTable extends SupabaseTable<SwipesRow> {
  @override
  String get tableName => 'swipes';

  @override
  SwipesRow createRow(Map<String, dynamic> data) => SwipesRow(data);
}

class SwipesRow extends SupabaseDataRow {
  SwipesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SwipesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get swiperId => getField<String>('swiper_id');
  set swiperId(String? value) => setField<String>('swiper_id', value);

  String? get swipeeId => getField<String>('swipee_id');
  set swipeeId(String? value) => setField<String>('swipee_id', value);

  bool? get liked => getField<bool>('liked');
  set liked(bool? value) => setField<bool>('liked', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
