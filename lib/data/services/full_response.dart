import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class FullResponse {
  /// The original HTTP URL response with headers and other relevant info.
  final http.Response response;

  /// The original data.
  Uint8List? get data => response.bodyBytes;

  /// The HTTP response status code.
  int get statusCode => response.statusCode;

  FullResponse({required this.response});

  /// Helper function to get value for a specific HTTP header field.
  String? valueForHTTPHeaderField(String field) {
    return response.headers[field];
  }

  /// Helper function to decode data as an entity, if needed.
  T decode<T>(T Function(Map<String, dynamic>) fromJson) {
    if (data == null) {
      throw Exception('nullResponseData');
    }

    try {
      final jsonString = latin1.decode(data!);
      final Map<String, dynamic> decodedJson = jsonDecode(jsonString);
      return fromJson(decodedJson);
    } catch (e) {
      print('Erro ao decodificar JSON: $e');
      throw Exception(
          'Not posible to decode'); // Re-throw para lidar com a exceção
    }
  }

  List<T> decodeList<T>(T Function(Map<String, dynamic>) fromJson) {
    if (data == null) {
      throw Exception('nullResponseData');
    }

    try {
      final List<dynamic> decodedJson = jsonDecode(utf8.decode(data!));
      return decodedJson.map((e) => fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Erro ao decodificar JSON: $e');
      throw Exception(
          'Not posible to decode'); // Re-throw para lidar com a exceção
    }
  }
}
