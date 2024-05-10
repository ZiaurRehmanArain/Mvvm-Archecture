import 'package:mvvmarchecture/data/network/BaseApiServices.dart';
import 'package:mvvmarchecture/data/network/NetworkApiServices.dart';
import 'package:mvvmarchecture/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      // ignore: unused_local_variable
      final response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrlEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      final response = await _apiServices.getPostApiResponse(
          AppUrl.registerUrlEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
