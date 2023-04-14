import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishop/screens/ItemDetailsScreen/ItemDetailsScreen.dart';
import 'package:ishop/screens/SuccessfulResetPasswordScreen/SuccessfullResetPasswordScreen.dart';
import 'package:ishop/screens/commonComponents/TextImageScreen.dart';
import 'package:ishop/screens/confirmationCodeScreen/ConfirmationCodeScreen.dart';
import 'package:ishop/screens/editProfileScreen/EditProfileScreen.dart';
import 'package:ishop/screens/forgotPasswordScreen/ForgotPasswordScreen.dart';
import 'package:ishop/screens/intro_screen/IntroScreens.dart';
import 'package:ishop/screens/loginScreen/LoginScreen.dart';
import 'package:ishop/screens/mainScreen/MenuMainScreen/FilterScreen.dart';
import 'package:ishop/screens/mainScreen/common/NavigationBarTemplate.dart';
import 'package:ishop/screens/mainScreen/profileMainScreen/MyAddressScreen.dart';
import 'package:ishop/screens/mainScreen/profileMainScreen/MyPromoCodesScreen.dart';
import 'package:ishop/screens/mainScreen/profileMainScreen/OrderHistoryScreen.dart';
import 'package:ishop/screens/mainScreen/profileMainScreen/PaymentMethodScreen.dart';
import 'package:ishop/screens/offerDetailsScreen/OfferDetailsScreen.dart';
import 'package:ishop/screens/resetPasswordScreen/ResetPasswordScreen.dart';
import 'package:ishop/screens/signUpScreen/SignUpScreen.dart';
import 'package:ishop/services/constants/UrlConstants.dart';
import 'constants/Routes.dart';
import 'constants/UIResources.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) => TextImageScreen(
        buttonText: 'RETURN TO HOME PAGE',
        uiTextImage: UIResources.UNEXPECTED_ERROR_TEXT_IMAGE,
      );
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    print('Exception happened\n' + errorDetails.toString());
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    UrlConstants.ENV = ENVIRONMENT.LOCAL_HOST;
    return MaterialApp(
      home: IntroScreens(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        Routes.SIGN_UP: (context) => const SignUpScreen(),
        Routes.SIGN_IN: (context) => const LoginScreen(),
        Routes.FORGOT_PASSWORD: (context) => const ForgotPasswordScreen(),
        Routes.CONFIRMATION_CODE: (context) => const ConfirmationCodeScreen(),
        Routes.RESET_PASSWORD: (context) => const ResetPasswordScreen(),
        Routes.SUCCESSFUL_RESET_PASSWORD: (context) =>
            const SuccessfulResetPasswordScreen(),
        Routes.HOME_NAVIGATION_BAR: (context) => NavigationBarTemplate(
              screenId: NavigationBarTemplate.HOME_SCREEN_ID,
            ),
        Routes.PROFILE_NAVIGATION_BAR: (context) => NavigationBarTemplate(
              screenId: NavigationBarTemplate.PROFILE_SCREEN_ID,
            ),
        Routes.MENU_NAVIGATION_BAR: (context) => NavigationBarTemplate(
              screenId: NavigationBarTemplate.MENU_SCREEN_ID,
            ),
        Routes.ITEM_DETAILS: (context) => const ItemDetailsScreen(),
        Routes.OFFER_DETAILS: (context) => const OfferDetailsScreen(),
        Routes.FILTER: (context) => const FilterScreen(),
        Routes.EDIT_PROFILE: (context) => const EditProfileScreen(),
        Routes.ORDER_HISTORY: (context) => const OrderHistoryScreen(),
        Routes.PAYMENT_METHOD: (context) => const PaymentMethodScreen(),
        Routes.MY_ADDRESS: (context) => const MyAddressScreen(),
        Routes.MY_PROMO_CODES: (context) => const MyPromoCodesScreen(),
      },
    );
  }
}
