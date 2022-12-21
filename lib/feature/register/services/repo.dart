// Project imports:
import 'package:registration_demo/core/typedef.dart';
import 'package:registration_demo/feature/register/domain/datasource.dart';
import 'package:registration_demo/feature/register/domain/entity/register_dto.dart';
import 'package:registration_demo/feature/register/domain/repo.dart';
import 'package:registration_demo/feature/register/services/params/register_param.dart';

class RegisterImpl implements RegisterRepo {
  RegisterImpl(this.productDatasource);
  AuthDatasource productDatasource;

  @override
  Future<ErrorOrType<RegisterDto>> register({required RegisterParam param}) async {
    return await productDatasource.register(param);
  }
}
