import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motora/utils/token_storage.dart';

class ApiException implements Exception {
  final int? statusCode;
  final String message;
  final dynamic data;

  const ApiException({this.statusCode, required this.message, this.data});

  @override
  String toString() {
    return 'ApiException($statusCode): $message';
  }
}

class ApiClient {
  ApiClient({
    required this.baseUrl,
    TokenStorage? tokenStorage,
    http.Client? client,
  }) : _tokenStorage = tokenStorage ?? TokenStorage(),
       _client = client ?? http.Client();

  final String baseUrl;

  final TokenStorage _tokenStorage;

  final http.Client _client;

  static const Duration _timeout = Duration(seconds: 30);

  Future<void> setToken(String token) async {
    await _tokenStorage.saveToken(token);
  }

  Future<String?> getToken() async {
    return _tokenStorage.getToken();
  }

  Future<void> clearToken() async {
    await _tokenStorage.deleteToken();
  }

  Future<Map<String, String>> _headers({bool authenticated = true}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (authenticated) {
      final token = await _tokenStorage.getToken();

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  Uri _buildUri(String path, {Map<String, dynamic>? queryParameters}) {
    final normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;

    final normalizedPath = path.startsWith('/') ? path : '/$path';

    return Uri.parse('$normalizedBaseUrl$normalizedPath').replace(
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
  }

  dynamic _handleResponse(http.Response response) {
    dynamic body;

    if (response.body.isNotEmpty) {
      try {
        body = jsonDecode(response.body);
      } catch (_) {
        body = response.body;
      }
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    }

    print(response.body);

    String message = 'Terjadi kesalahan pada server';

    if (body is Map<String, dynamic>) {
      message =
          body['message']?.toString() ?? body['error']?.toString() ?? message;
    }

    switch (response.statusCode) {
      case 400:
        message = message == 'Terjadi kesalahan pada server'
            ? 'Request tidak valid'
            : message;
        break;

      case 401:
        message = 'Session tidak valid atau telah berakhir';
        break;

      case 403:
        message = 'Anda tidak memiliki akses';
        break;

      case 404:
        message = 'Data tidak ditemukan';
        break;

      case 409:
        message = 'Data sudah tersedia';
        break;

      case 422:
        message = 'Data yang dikirim tidak valid';
        break;

      case 500:
        message = 'Terjadi kesalahan pada server';
        break;
    }

    throw ApiException(
      statusCode: response.statusCode,
      message: message,
      data: body,
    );
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool authenticated = true,
  }) async {
    try {
      final response = await _client
          .get(
            _buildUri(path, queryParameters: queryParameters),
            headers: await _headers(authenticated: authenticated),
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }

      throw ApiException(message: 'Tidak dapat terhubung ke server', data: e);
    }
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authenticated = true,
  }) async {
    try {
      final response = await _client
          .post(
            _buildUri(path, queryParameters: queryParameters),
            headers: await _headers(authenticated: authenticated),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }

      throw ApiException(message: 'Tidak dapat terhubung ke server', data: e);
    }
  }

  Future<dynamic> postMultipart(
    String path, {
    required Map<String, String> fields,
    Map<String, String>? files,
    bool authenticated = true,
  }) async {
    try {
      final request = http.MultipartRequest('POST', _buildUri(path));

      final headers = await _headers(authenticated: authenticated);

      request.headers.addAll(headers);

      request.fields.addAll(fields);

      if (files != null) {
        for (final entry in files.entries) {
          request.files.add(
            await http.MultipartFile.fromPath(entry.key, entry.value),
          );
        }
      }

      final streamedResponse = await request.send().timeout(_timeout);

      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }

      throw ApiException(message: 'Tidak dapat terhubung ke server', data: e);
    }
  }

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authenticated = true,
  }) async {
    try {
      final response = await _client
          .put(
            _buildUri(path, queryParameters: queryParameters),
            headers: await _headers(authenticated: authenticated),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }

      throw ApiException(message: 'Tidak dapat terhubung ke server', data: e);
    }
  }

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authenticated = true,
  }) async {
    try {
      final response = await _client
          .patch(
            _buildUri(path, queryParameters: queryParameters),
            headers: await _headers(authenticated: authenticated),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }

      throw ApiException(message: 'Tidak dapat terhubung ke server', data: e);
    }
  }

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool authenticated = true,
  }) async {
    try {
      final response = await _client
          .delete(
            _buildUri(path, queryParameters: queryParameters),
            headers: await _headers(authenticated: authenticated),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }

      throw ApiException(message: 'Tidak dapat terhubung ke server', data: e);
    }
  }

  void dispose() {
    _client.close();
  }
}

final api = ApiClient(
  baseUrl: "https://2e22-103-30-193-55.ngrok-free.app/api",
  tokenStorage: TokenStorage(),
);
