
import 'package:cbc/data/models/result.dart';
import 'package:cbc/data/services/route_services.dart';

abstract class BaseApiService {
  Future<Result> request<T>(RouteServices route,
      {int? id, dynamic jsonbody, String? token, String? query});
}

abstract class BaseManager {
  final BaseApiService rest;
  BaseManager(this.rest); 
}
