import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_currentUserProfile') != null) {
        try {
          _currentUserProfile = jsonDecode(
              await secureStorage.getString('ff_currentUserProfile') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_authUserDetails') != null) {
        try {
          _authUserDetails = jsonDecode(
              await secureStorage.getString('ff_authUserDetails') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _profilePictures =
          await secureStorage.getStringList('ff_profilePictures') ??
              _profilePictures;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<dynamic> _potentialMatches = [];
  List<dynamic> get potentialMatches => _potentialMatches;
  set potentialMatches(List<dynamic> value) {
    _potentialMatches = value;
  }

  void addToPotentialMatches(dynamic value) {
    potentialMatches.add(value);
  }

  void removeFromPotentialMatches(dynamic value) {
    potentialMatches.remove(value);
  }

  void removeAtIndexFromPotentialMatches(int index) {
    potentialMatches.removeAt(index);
  }

  void updatePotentialMatchesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    potentialMatches[index] = updateFn(_potentialMatches[index]);
  }

  void insertAtIndexInPotentialMatches(int index, dynamic value) {
    potentialMatches.insert(index, value);
  }

  List<dynamic> _swipeHistory = [];
  List<dynamic> get swipeHistory => _swipeHistory;
  set swipeHistory(List<dynamic> value) {
    _swipeHistory = value;
  }

  void addToSwipeHistory(dynamic value) {
    swipeHistory.add(value);
  }

  void removeFromSwipeHistory(dynamic value) {
    swipeHistory.remove(value);
  }

  void removeAtIndexFromSwipeHistory(int index) {
    swipeHistory.removeAt(index);
  }

  void updateSwipeHistoryAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    swipeHistory[index] = updateFn(_swipeHistory[index]);
  }

  void insertAtIndexInSwipeHistory(int index, dynamic value) {
    swipeHistory.insert(index, value);
  }

  bool _isSwipeStackVisible = true;
  bool get isSwipeStackVisible => _isSwipeStackVisible;
  set isSwipeStackVisible(bool value) {
    _isSwipeStackVisible = value;
  }

  List<dynamic> _profileBuffer = [];
  List<dynamic> get profileBuffer => _profileBuffer;
  set profileBuffer(List<dynamic> value) {
    _profileBuffer = value;
  }

  void addToProfileBuffer(dynamic value) {
    profileBuffer.add(value);
  }

  void removeFromProfileBuffer(dynamic value) {
    profileBuffer.remove(value);
  }

  void removeAtIndexFromProfileBuffer(int index) {
    profileBuffer.removeAt(index);
  }

  void updateProfileBufferAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    profileBuffer[index] = updateFn(_profileBuffer[index]);
  }

  void insertAtIndexInProfileBuffer(int index, dynamic value) {
    profileBuffer.insert(index, value);
  }

  bool _autoUpdate = false;
  bool get autoUpdate => _autoUpdate;
  set autoUpdate(bool value) {
    _autoUpdate = value;
  }

  String _testLocation = '';
  String get testLocation => _testLocation;
  set testLocation(String value) {
    _testLocation = value;
  }

  dynamic _currentUserProfile;
  dynamic get currentUserProfile => _currentUserProfile;
  set currentUserProfile(dynamic value) {
    _currentUserProfile = value;
    secureStorage.setString('ff_currentUserProfile', jsonEncode(value));
  }

  void deleteCurrentUserProfile() {
    secureStorage.delete(key: 'ff_currentUserProfile');
  }

  dynamic _authUserDetails = jsonDecode('null');
  dynamic get authUserDetails => _authUserDetails;
  set authUserDetails(dynamic value) {
    _authUserDetails = value;
    secureStorage.setString('ff_authUserDetails', jsonEncode(value));
  }

  void deleteAuthUserDetails() {
    secureStorage.delete(key: 'ff_authUserDetails');
  }

  List<String> _profilePictures = [];
  List<String> get profilePictures => _profilePictures;
  set profilePictures(List<String> value) {
    _profilePictures = value;
    secureStorage.setStringList('ff_profilePictures', value);
  }

  void deleteProfilePictures() {
    secureStorage.delete(key: 'ff_profilePictures');
  }

  void addToProfilePictures(String value) {
    profilePictures.add(value);
    secureStorage.setStringList('ff_profilePictures', _profilePictures);
  }

  void removeFromProfilePictures(String value) {
    profilePictures.remove(value);
    secureStorage.setStringList('ff_profilePictures', _profilePictures);
  }

  void removeAtIndexFromProfilePictures(int index) {
    profilePictures.removeAt(index);
    secureStorage.setStringList('ff_profilePictures', _profilePictures);
  }

  void updateProfilePicturesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    profilePictures[index] = updateFn(_profilePictures[index]);
    secureStorage.setStringList('ff_profilePictures', _profilePictures);
  }

  void insertAtIndexInProfilePictures(int index, String value) {
    profilePictures.insert(index, value);
    secureStorage.setStringList('ff_profilePictures', _profilePictures);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
