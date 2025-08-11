import '../database.dart';

class PreferencesTable extends SupabaseTable<PreferencesRow> {
  @override
  String get tableName => 'preferences';

  @override
  PreferencesRow createRow(Map<String, dynamic> data) => PreferencesRow(data);
}

class PreferencesRow extends SupabaseDataRow {
  PreferencesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PreferencesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get interestedInGender => getField<String>('interested_in_gender');
  set interestedInGender(String? value) =>
      setField<String>('interested_in_gender', value);

  int? get ageMin => getField<int>('age_min');
  set ageMin(int? value) => setField<int>('age_min', value);

  int? get ageMax => getField<int>('age_max');
  set ageMax(int? value) => setField<int>('age_max', value);

  int? get distanceRadius => getField<int>('distance_radius');
  set distanceRadius(int? value) => setField<int>('distance_radius', value);

  List<String> get matchLanguages => getListField<String>('match_languages');
  set matchLanguages(List<String>? value) =>
      setListField<String>('match_languages', value);

  List<String> get relationshipType =>
      getListField<String>('relationship_type');
  set relationshipType(List<String>? value) =>
      setListField<String>('relationship_type', value);

  String? get jobTitle => getField<String>('job_title');
  set jobTitle(String? value) => setField<String>('job_title', value);

  int? get height => getField<int>('height');
  set height(int? value) => setField<int>('height', value);

  int? get weight => getField<int>('weight');
  set weight(int? value) => setField<int>('weight', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get familyPlans => getField<String>('family_plans');
  set familyPlans(String? value) => setField<String>('family_plans', value);

  String? get education => getField<String>('education');
  set education(String? value) => setField<String>('education', value);

  String? get loveLanguage => getField<String>('love_language');
  set loveLanguage(String? value) => setField<String>('love_language', value);

  String? get pets => getField<String>('pets');
  set pets(String? value) => setField<String>('pets', value);

  String? get drinking => getField<String>('drinking');
  set drinking(String? value) => setField<String>('drinking', value);

  String? get smoking => getField<String>('smoking');
  set smoking(String? value) => setField<String>('smoking', value);

  String? get excercise => getField<String>('excercise');
  set excercise(String? value) => setField<String>('excercise', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);
}
