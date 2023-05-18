import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'http_method.dart';

dynamic _parseBody(dynamic body) {
  try {
    return jsonEncode(body);
  } catch (_) {
    return body;
  }
}

Future<Response> sendRequest({
  required Uri url,
  required HttpMethod method,
  required Map<String, String> headers,
  required dynamic body,
  required Duration timeOut,
}) {
  var finalHeaders = {...headers};
  if (method == HttpMethod.GET) {
    final ContentType = headers['Content-Type'];
    if (ContentType == null || ContentType.contains("aplication/json")) {
      finalHeaders['Content-Type'] = 'application/json; charset=UTF-8';
      body = _parseBody(body);
    }
  }

  final client = Client();
  switch (method) {
    case HttpMethod.GET:
      return client
          .get(
            url,
            headers: finalHeaders,
          )
          .timeout(timeOut);
    // TODO: Handle this case.
    case HttpMethod.POST:
      return client
          .post(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
    // TODO: Handle this case.
    case HttpMethod.PUT:
      return client
          .put(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
    // TODO: Handle this case.
    case HttpMethod.PATCH:
      return client
          .patch(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
    // TODO: Handle this case.
    case HttpMethod.DELETE:
      return client
          .delete(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
    // TODO: Handle this case.
  }
}
