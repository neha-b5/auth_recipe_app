import 'package:dio/dio.dart';
import 'package:frontend/consts.dart';

class HTTPService {
  static final HTTPService _singleton = HTTPService._internal();
  final _dio = Dio();

  factory HTTPService() {
    return _singleton;
  }
  HTTPService._internal() {
    setup();
  }

  Future<void> setup({String? bearerToken}) async {
    final headers = {
      "Content-Type": "application/json",
    };
    final options = BaseOptions(
      baseUrl: API_BASE_URL,
      headers: headers,
      validateStatus: (status) {
        if (status == null) return false;
        return status < 500;
      },
    );
    _dio.options = options;
  }

  Future<Response?> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
