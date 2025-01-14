import 'package:cbc/data/models/result.dart';
import 'package:cbc/data/services/base_api_service.dart';
import 'package:cbc/data/services/route_services.dart';

class HomeRepository extends BaseManager {
  HomeRepository(super.rest);

  Future<Result> getResearches() {
    return rest.request(RouteServices.getResearch);
  }
}