// Fake class

// Dart imports:
import 'dart:convert';
import 'dart:math';

// Package imports:
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

class FakeClient extends Fake implements Client {
  static const uuid = Uuid();
  final random = Random();

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    // delay to simulate network delay
    await Future.delayed(Duration(milliseconds: random.nextInt(2000)));

    final content = body as Map<String, dynamic>;
    final email = content['email'];
    final password = content['password'];
    if (email == 'peter@brown.com' && password == 'PeterBrown9') {
      return Response(jsonEncode({'token': uuid.v4()}), 200);
    }
    return Response(jsonEncode({'message': 'Invalid login details'}), 403);
  }
}
