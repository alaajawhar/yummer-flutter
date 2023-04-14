import 'package:dio/dio.dart';
import 'package:ishop/services/modules/UserModule.dart';

import '../utils/DioUtils.dart';
import '../constants/UrlConstants.dart';

class UserService{
  Future<GetProfileResponse> getProfile() async {
    Response response = await ApiUtils().getDio().get(UrlConstants.GET_PROFILE);
    return GetProfileResponse.fromJson(response.data);
  }

  Future<GetAddressesResponse> getAddresses() async {
    Response response = await ApiUtils().getDio().get(UrlConstants.GET_ADDRESSES);
    return GetAddressesResponse.fromJson(response.data);
  }
}