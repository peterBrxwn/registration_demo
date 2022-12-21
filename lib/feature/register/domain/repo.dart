// Project imports:
import 'package:registration_demo/core/typedef.dart';
import 'package:registration_demo/feature/register/domain/entity/register_dto.dart';
import 'package:registration_demo/feature/register/services/params/register_param.dart';

abstract class RegisterRepo {
  Future<ErrorOrType<RegisterDto>> register({required RegisterParam param});
}
