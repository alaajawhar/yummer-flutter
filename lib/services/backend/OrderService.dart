import 'package:dio/dio.dart';
import 'package:ishop/services/modules/StoreModule.dart';
import '../utils/DioUtils.dart';
import '../constants/UrlConstants.dart';

class OrderService{
  Future<GetStoreOrdersResponse> getStoreOrders() async {
    Response response = await ApiUtils().getDio().post(UrlConstants.GET_STORE_ORDERS);
    return GetStoreOrdersResponse.fromJson(response.data);
  }
  Future<GetStoreOffersResponse> getStoreOffers() async {
    Response response = await ApiUtils().getDio().post(UrlConstants.GET_STORE_OFFERS);
    return GetStoreOffersResponse.fromJson(response.data);
  }

  Future<GetFiltersResponse> getFilters() async {
    Response response = await ApiUtils().getDio().get(UrlConstants.GET_FILTERS);
    return GetFiltersResponse.fromJson(response.data);
  }

  Future<GetPromocodesResponse> getPromoCodes() async {
    Response response = await ApiUtils().getDio().post(UrlConstants.GET_PROMO_CODES);
    return GetPromocodesResponse.fromJson(response.data);
  }
}