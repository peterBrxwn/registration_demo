// Package imports:
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:registration_demo/core/app_error.dart';

// Project imports:

import 'package:registration_demo/core/typedef.dart';
import 'package:registration_demo/feature/register/domain/datasource.dart';
import 'package:registration_demo/feature/register/domain/entity/register_dto.dart';
import 'package:registration_demo/feature/register/services/fake_client.dart';
import 'package:registration_demo/feature/register/services/model/register_dto.dart';
import 'package:registration_demo/feature/register/services/params/register_param.dart';

class AuthDatasourceImpl implements AuthDatasource {
  AuthDatasourceImpl();

  @override
  Future<ErrorOrType<RegisterDto>> register(RegisterParam param) async {
    try {
      final client = FakeClient();
      final response = await client.post(
        Uri.parse('https://test.com'),
        body: param.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(RegisterDtoImpl.fromJson(jsonDecode(response.body)));
      } else {
        return Left(AppError());
      }
    } catch (e) {
      return Left(AppError());
    }
  }
}
