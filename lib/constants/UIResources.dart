import 'Routes.dart';

class UIResources {
  static String FONT = "Mulish";

  // TEXTS
  static String BRAND_NAME = "IShop";
  static String FORGOT_PASSWORD_TEXT =
      "Please enter your email address. You will receive a link to create a new password via email.";

  // IMAGES
  static String DEFAULT_PROFILE_PICTURE =
      'assets/icons/default/CashedProfilePic.png';
  static String DEFAULT_ORDER_ITEM = 'assets/icons/default/CashedOrderItem.png';
  static String DEFAULT_OFFER_ITEM = 'assets/icons/default/CashedOfferItem.png';
  static String HOME_APP_BAR_BACKGROUND = 'assets/images/HomeScreenHeader.png';

  //APP BOTTOM
  static String HOME_BOTTOM_BAR_ICON = 'assets/icons/HomeBottomBar.svg';
  static String MENU_BOTTOM_BAR_ICON = 'assets/icons/MenuBottomScreen.svg';
  static String ORDER_BOTTOM_BAR_ICON = 'assets/icons/OrderBottomBar.svg';
  static String PROFILE_BOTTOM_BAR_ICON = 'assets/icons/ProfileBottomBar.svg';

  //ICONS
  static String BACK_ARROW_ICON = 'assets/icons/back.svg';
  static String NEXT_ARROW_ICON = 'assets/icons/arrow-right.svg';

  //PROFILE
  static ProfileButton ORDER_HISTORY_BUTTON = ProfileButton(
      'assets/icons/calendar.svg', 'Order History', Routes.EDIT_PROFILE);
  static ProfileButton PAYMENT_METHOD_BUTTON = ProfileButton(
      'assets/icons/credit-card.svg', 'Payment Method', Routes.EDIT_PROFILE);
  static ProfileButton MY_ADDRESS_BUTTON = ProfileButton(
      'assets/icons/map-pin.svg', 'My Address', Routes.EDIT_PROFILE);
  static ProfileButton MY_PROMO_CODES_BUTTON = ProfileButton(
      'assets/icons/gift.svg', 'My Promocodes', Routes.EDIT_PROFILE);
  static ProfileButton MY_FAVORITES_BUTTON = ProfileButton(
      'assets/icons/heart.svg', 'My Favorite', Routes.EDIT_PROFILE);
  static ProfileButton SIGN_OUT_BUTTON = ProfileButton(
      'assets/icons/log-out.svg', 'Sign out', Routes.EDIT_PROFILE);

  //MY ADDRESS
  static String LOCATION_ICON = 'assets/icons/map-pin.svg';

  //TEXT_IMAGE IMAGES
  static String ON_BOARDING_SCREEN_1 = 'assets/images/OnboardingScreen1.svg';
  static String ON_BOARDING_SCREEN_2 = 'assets/images/OnboardingScreen2.svg';
  static String ON_BOARDING_SCREEN_3 = 'assets/images/OnboardingScreen3.svg';
  static String SUCCESSFUL_RESET_PASSWORD_IMAGE =
      'assets/images/SuccessfulResetPassword.svg';
  static String FAILURE_IMAGE = 'assets/images/Failure.svg';
  static String EMPTY_CART_IMAGE = 'assets/images/EmptyCart.svg';

  // TEXT_IMAGE
  static List<UITextImage> ON_BOARDING_LIST = [
    UITextImage(
        "Find the Shop!",
        "Qui ex aute ipsum duis. Incididunt adipisicing voluptate laborum.",
        ON_BOARDING_SCREEN_1),
    UITextImage(
        "Choose favorite Foods!",
        "Qui ex aute ipsum duisi. Incididunt adipisicing voluptate laborum.",
        ON_BOARDING_SCREEN_2),
    UITextImage(
        "Get your Order For delivery!",
        "Qui ex aute ipsum duis. Incididunt adipisicing voluptate laborum.",
        ON_BOARDING_SCREEN_3)
  ];
  static UITextImage SUCCESSFUL_RESET_PASSWORD_TEXT_IMAGE = UITextImage(
      "Your password has been reset!",
      "Qui ex aute ipsum duis. Incididunt adipisicing voluptate laborum",
      SUCCESSFUL_RESET_PASSWORD_IMAGE);
  static UITextImage UNEXPECTED_ERROR_TEXT_IMAGE = UITextImage("Sorry!",
      "Unexpected error happened, please try again later", FAILURE_IMAGE);
  static UITextImage EMPTY_CART_TEXT_IMAGE = UITextImage(
      "Your cart is empty!",
      "Cart's feeling a bit lonely. Explore our collection and add items to fill it up!",
      EMPTY_CART_IMAGE);
}

class UITextImage {
  String SCREEN_TITLE;
  String SCREEN_DESCRIPTION;

  String SCREEN_IMAGE;

  UITextImage(this.SCREEN_TITLE, this.SCREEN_DESCRIPTION, this.SCREEN_IMAGE);
}

class ProfileButton {
  String leadingIcon;
  String title;
  String routeId;

  ProfileButton(this.leadingIcon, this.title, this.routeId);

  static List<ProfileButton> profileMenuItems = [
    ProfileButton(
        'assets/icons/calendar.svg', 'Order History', Routes.ORDER_HISTORY),
    ProfileButton('assets/icons/credit-card.svg', 'Payment Method',
        Routes.PAYMENT_METHOD),
    ProfileButton('assets/icons/map-pin.svg', 'My Address', Routes.MY_ADDRESS),
    ProfileButton(
        'assets/icons/gift.svg', 'My Promocodes', Routes.MY_PROMO_CODES),
    ProfileButton(
        'assets/icons/heart.svg', 'My Favorite', Routes.MY_PROMO_CODES),
    ProfileButton('assets/icons/log-out.svg', 'Sign out', Routes.SIGN_IN),
  ];
}
