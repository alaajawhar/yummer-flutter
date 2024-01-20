
class UrlConstants{
  static ENVIRONMENT? ENV; //=  ENVIRONMENT.LOCAL_HOST;
  static String GET_PROFILE =  _getBaseUrl() + '/user/profile';
  static String GET_ADDRESSES =  _getBaseUrl() + '/user/addresses';
  static String GET_STORE_ORDERS =  _getBaseUrl() + '/store/order';
  static String GET_STORE_OFFERS =  _getBaseUrl() + '/store/offers';
  static String GET_FILTERS =  _getBaseUrl() + '/store/filters';
  static String GET_PROMO_CODES =  _getBaseUrl() + '/store/promocodes';


  static String _getBaseUrl(){
    String LOCAL_HOST_BASE_URL =  'http://localhost:8081/v1';
    String SIT_BASE_URL =  'https://4548-46-152-153-159.ngrok.io';
    String UAT_BASE_URL =  'http://localhost:8081';
    String PROD_BASE_URL =  'http://localhost:8081';

    switch(ENV){
      case ENVIRONMENT.LOCAL_HOST:
        {
          return LOCAL_HOST_BASE_URL;
        }
      case ENVIRONMENT.SIT:
        {
          return SIT_BASE_URL;
        }
      case ENVIRONMENT.UAT:
        {
          return UAT_BASE_URL;
        }
      case ENVIRONMENT.PROD:
        {
          return PROD_BASE_URL;
        }
      default: {
        return "";
      }
    }
  }
}

enum ENVIRONMENT {
  LOCAL_HOST,
  SIT,
  UAT,
  PROD
}

