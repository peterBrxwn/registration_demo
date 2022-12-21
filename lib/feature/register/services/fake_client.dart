// Fake class
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class FakeClient extends Fake implements Client {
  static const uuid = Uuid();
  final random = Random();

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
    await Future.delayed(Duration(milliseconds: random.nextInt(3000)));
    return Response(jsonEncode({'token': uuid.v4()}), 200);
    // return Response(jsonEncode({'message': 'Invalid login details'}), 403);
  }
}
