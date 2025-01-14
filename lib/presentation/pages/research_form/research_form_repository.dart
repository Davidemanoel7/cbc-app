
import 'package:cbc/data/models/result.dart';
import 'package:cbc/data/services/base_api_service.dart';
import 'package:cbc/data/services/route_services.dart';

class ResearchFormRepository extends BaseManager {
  ResearchFormRepository(super.rest);

  Future<Result> sendResearch() {
    return rest.request(RouteServices.postResearch);
  }
}