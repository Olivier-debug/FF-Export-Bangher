import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPerspectiveMatchesCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? genderFilter = '',
    int? radius,
    int? ageMin,
    int? ageMax,
    int? limitArg,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id_arg": "${userId}",
  "gender_arg": "${genderFilter}",
  "radius_arg": ${radius},
  "age_min_arg": ${ageMin},
  "age_max_arg": ${ageMax},
  "limit_arg": ${limitArg}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetPerspectiveMatches',
      apiUrl:
          'https://ccaxkmbpnvuuhxgtjjnv.supabase.co/rest/v1/rpc/get_potential_matches',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjYXhrbWJwbnZ1dWh4Z3Rqam52Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU4OTgwODUsImV4cCI6MjA0MTQ3NDA4NX0.yWf3OGPwArMNh_xUppY5Wbo972L-6nNt64V5jbqLJuY',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjYXhrbWJwbnZ1dWh4Z3Rqam52Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU4OTgwODUsImV4cCI6MjA0MTQ3NDA4NX0.yWf3OGPwArMNh_xUppY5Wbo972L-6nNt64V5jbqLJuY',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? potentialMatchId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].potential_match_id''',
      ));
  static String? matchGender(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].gender''',
      ));
  static String? matchName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].name''',
      ));
  static int? matchAge(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].age''',
      ));
  static List<String>? matchPhotos(dynamic response) => (getJsonField(
        response,
        r'''$[:].photos''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetLatesMatchInfoCall {
  static Future<ApiCallResponse> call({
    String? userId1 = '',
    String? userId2 = '',
    String? authUserId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id1": "${userId1}",
  "user_id2": "${userId2}",
  "auth_user_id": "${authUserId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetLatesMatchInfo',
      apiUrl:
          'https://ccaxkmbpnvuuhxgtjjnv.supabase.co/rest/v1/rpc/get_latest_match_info',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjYXhrbWJwbnZ1dWh4Z3Rqam52Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU4OTgwODUsImV4cCI6MjA0MTQ3NDA4NX0.yWf3OGPwArMNh_xUppY5Wbo972L-6nNt64V5jbqLJuY',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNjYXhrbWJwbnZ1dWh4Z3Rqam52Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU4OTgwODUsImV4cCI6MjA0MTQ3NDA4NX0.yWf3OGPwArMNh_xUppY5Wbo972L-6nNt64V5jbqLJuY',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? authUserName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].auth_user_name''',
      ));
  static String? authUserProfilePicture(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].auth_user_profile_picture''',
      ));
  static String? matchUserName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].match_user_name''',
      ));
  static String? matchUserProfilePicture(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].match_user_profile_picture''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
