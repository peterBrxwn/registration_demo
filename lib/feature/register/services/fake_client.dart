// Fake class
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class FakeClient extends Fake implements Client {
  @override
  Future<Response> get(Uri? url, {Map<String, String>? headers}) async {
    return Response('', 200);
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final random = Random();
    await Future.delayed(Duration(milliseconds: random.nextInt(3000)));
    return Response('', 200);
  }
}
