import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  List<double> get location2 => getListField<double>('location2');
  set location2(List<double>? value) =>
      setListField<double>('location2', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  DateTime? get lastSeen => getField<DateTime>('last_seen');
  set lastSeen(DateTime? value) => setField<DateTime>('last_seen', value);

  bool? get isOnline => getField<bool>('is_online');
  set isOnline(bool? value) => setField<bool>('is_online', value);

  List<String> get myLanguages => getListField<String>('my_languages');
  set myLanguages(List<String>? value) =>
      setListField<String>('my_languages', value);

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

  String? get exercise => getField<String>('exercise');
  set exercise(String? value) => setField<String>('exercise', value);

  String? get currentCity => getField<String>('current_city');
  set currentCity(String? value) => setField<String>('current_city', value);

  DateTime? get dateOfBirth => getField<DateTime>('date_of_birth');
  set dateOfBirth(DateTime? value) =>
      setField<DateTime>('date_of_birth', value);

  String? get dietPreference => getField<String>('diet_preference');
  set dietPreference(String? value) =>
      setField<String>('diet_preference', value);

  String? get socialMedia => getField<String>('social_media');
  set socialMedia(String? value) => setField<String>('social_media', value);

  String? get sleepingHabits => getField<String>('sleeping_habits');
  set sleepingHabits(String? value) =>
      setField<String>('sleeping_habits', value);

  String? get communicationStyle => getField<String>('communication_style');
  set communicationStyle(String? value) =>
      setField<String>('communication_style', value);

  String? get school => getField<String>('school');
  set school(String? value) => setField<String>('school', value);

  String? get religion => getField<String>('religion');
  set religion(String? value) => setField<String>('religion', value);

  List<String> get profilePictures => getListField<String>('profile_pictures');
  set profilePictures(List<String>? value) =>
      setListField<String>('profile_pictures', value);

  List<String> get relationshipGoals =>
      getListField<String>('relationship_goals');
  set relationshipGoals(List<String>? value) =>
      setListField<String>('relationship_goals', value);

  List<String> get interests => getListField<String>('interests');
  set interests(List<String>? value) =>
      setListField<String>('interests', value);
}
