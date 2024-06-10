abstract class IRequestHandler {
  Future<dynamic> httpGet({
    required String url,
    bool needAth = false,
    bool forceDontAuth = false,
    Map<String, String> optionalHeaders = const {},
  });
  Future<dynamic> httpPost({
    required String url,
    required Object? fields,
    bool forceDontAuth = false,
    Map<String, String> optionalHeaders = const {},
    bool needAth = false,
  });
  Future<Map<String, dynamic>> httpPut({
    required String url,
    required Object? fields,
    bool forceDontAuth = false,
    Map<String, String> optionalHeaders = const {},
    bool needAth = false,
  });
}
