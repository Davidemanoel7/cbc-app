
import 'dart:convert';
import 'dart:io';

import 'package:cbc/data/models/result.dart';
import 'package:cbc/data/services/base_api_service.dart';
import 'package:cbc/data/services/full_response.dart';
import 'package:cbc/data/services/route_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestService implements BaseApiService {

  final http.Client client;

  RestService({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<Result> request<T>(RouteServices route, {int? id, jsonbody, String? token, String? query}) async {
    try {
      var url = 'http://localhost:8080${route.path}';

      if (id != null) {
        url = url.replaceAll(':id', id.toString());
      }

      if (query != null) {
        url = '$url?$query';
      }

      dynamic response;

      var headers = getHeaders(route, token);

      switch (route.method) {
        case MethodRequests.GET:
          response = await client.get(Uri.parse(url), headers: headers).timeout(const Duration(seconds: 30));
        case MethodRequests.POST:
          response = await client.post(Uri.parse(url), body: jsonEncode(jsonbody), headers: headers);
        case MethodRequests.PATCH:
          response = await client.patch(Uri.parse(url), body: jsonEncode(jsonbody), headers: headers);
        case MethodRequests.PUT:
          response = await client.put(Uri.parse(url), body: jsonEncode(jsonbody), headers: headers);
        case MethodRequests.DELETE:
          response = await client.delete(Uri.parse(url), headers: headers);
      }

      FullResponse fullResponse = FullResponse(response: response);

      _debug(route.method, url, jsonbody, headers.toString(), response);

      if (fullResponse.statusCode >= 200 && fullResponse.statusCode <= 299) {
        return Result.fromSuccess(fullResponse);
      } else {
        return Result.fromFailure('Failed with status code: ${fullResponse.statusCode}');
      }
    } catch (e) {
      return Result.fromFailure(e);
    }
  }

  Map<String, String>? getHeaders(RouteServices route, String? token) {
    var platForm =
        "${Platform.operatingSystem} ${Platform.operatingSystemVersion}";

    switch (route) {
      case RouteServices.getResearch:
        return {
          "Content-Type": "application/json",
          "User-Agent": "CBC App/1.0 $platForm"
        };
      default:
        if (token != null) {
          return {
            "Content-Type": "application/json",
            "Accept": "application/json",
          "User-Agent": "CBC App/1.0 $platForm"
          };
        } else {
          return {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "User-Agent": "CBC App/1.0 $platForm"
          };
        }
    }
  }

  _debug(MethodRequests method, String url, dynamic data, String headers,
      dynamic response) {
    const line = '------------------------------------';

    debugPrint(line);

    debugPrint("Request");

    debugPrint(line);

    debugPrint(method.toString());

    debugPrint(url);

    debugPrint('Headers: $headers');

    debugPrint(line);

    debugPrint('JsonBody: $data');

    debugPrint(line);

    debugPrint("Response");

    debugPrint(line);

    debugPrint('StatusCode: ${response.statusCode.toString()}');

    debugPrint('Response Headers: ${response.headers}');

    debugPrint(response.body ?? "");

    debugPrint(response.request?.method);
  }

}