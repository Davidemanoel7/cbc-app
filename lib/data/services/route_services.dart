// ignore_for_file: constant_identifier_names
enum RouteServices {
  
  getResearch(MethodRequests.GET, '/research'),
  postResearch(MethodRequests.POST, '/research'),
  putResearch(MethodRequests.PUT, '/research'),
  ;

  final String path;
  final MethodRequests method;
  const RouteServices(this.method, this.path);

}

enum MethodRequests {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE;
}