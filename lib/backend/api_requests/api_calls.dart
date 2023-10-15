import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WizModelCall {
  static Future<ApiCallResponse> call() {
    final ffApiRequestBody = '''
{"prompt": "puppy dog running on grass, in manga style","steps": 100}''';
    return ApiManager.instance.makeApiCall(
      callName: 'WizModel',
      apiUrl: 'https://api.wizmodel.com/sdapi/v1/txt2img',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Bearer YOUR_API_KEY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GenAIImageCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) {
    final ffApiRequestBody = '''
{
  "prompt": "${prompt}",
  "n": 1,
  "size": "512x512"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GenAI Image',
      apiUrl: 'https://api.openai.com/v1/images/generations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic imageResponse(dynamic response) => getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      );
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
