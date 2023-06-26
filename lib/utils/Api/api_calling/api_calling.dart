import 'package:four20society/constants/apis_path/api_config_string.dart';
import 'package:four20society/feature/auth/login/model/login_model.dart';
import 'package:four20society/utils/Api/api_provider.dart';

class ApiCalling{

  Future<dynamic>  loginAPi() {
    final apiProvider = ApiProvider();
    LoginModel loginModel = LoginModel();
    Map<String, dynamic> reqModel = {};
    return apiProvider.dataProcessor(reqModel, loginModel, ApiEndPoints.login);
  }
}