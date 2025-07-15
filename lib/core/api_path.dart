class ApiPath {
  static const String config = '/api/v1/config';
  //User
  static const String login = '/api/v1/auth/customer/login';
  static const String socialLogin = '/api/v1/auth/customer/social-login';
  static const String verifyOtp = '/api/v1/auth/customer/verify-otp';
  static const String profile = '/api/v1/customer/profile';
  static const String register = '/api/v1/auth/customer/register';
  static const String searchPlace = '/api/v1/config/place-autocomplete';
  static const String placeDetails = '/api/v1/config/place-api-details';
  static const String updateProfile = '/api/v1/customer/update';
  static const String getOrders = '/api/v1/customer/trips';
  static const String getTripDetails = '/api/v1/customer/trip-details';
  static const String getAddresses = '/api/v1/customer/get-addresses';
  static const String addAddress = '/api/v1/customer/add-address';
  static const String updateAddress = '/api/v1/customer/update-address';

  static const String deleteAddress = '/api/v1/customer/delete-address';
  static const String placeTrip = '/api/v1/customer/place-trip';
  static const String rateCapten = '/api/v1/customer/rating-capten';
  static const String checkCancelFee = '/api/v1/customer/check-cancel-Fee';
  static const String getCancelReasons = '/api/v1/customer/cancel-reasons';

  static const String cancelTrip = '/api/v1/customer/cancel-trip';
  static const String wallet = '/api/v1/customer/get-wallet-transactions';
  static const String addBalanceToWallet = '/api/v1/customer/add-wallet-balance';
  static const String getWalletBalance = '/api/v1/customer/get-balance';

  static const String availableTrips = '/api/v1/customer/available-rides';
  static const String applyCoupon = '/api/v1/customer/available-rides-coupon';
  static const String placeAddress = '/api/v1/config/place-api-address';
  static const String checkZone = '/api/v1/config/get-zone-id';
  static const String getNotifications = '/api/v1/customer/get-notifications';
  static const String getCheckOutId = '/api/v1/hyperpay/checkouts';
  static const String getPaymentStatus = '/api/v1/hyperpay/payment-status';
  static const String markTripPaid = '/api/v1/hyperpay/mark-trip-paid';
  static const String updateFcmToken = '/api/v1/customer/update-fcm-token';
  static const String deleteAccount = '/api/v1/customer/store-block';

  static const String chat = '/api/v1/customer/conversations';

  static const String updateCaptainStatus = '/api/v1/capten/update-status';
  static const String getFAQs = '/api/v1/faqs';
  static const String getCities = '/api/v1/config/get-cites';
  static const String getAlZones = '/api/v1/config/countries-timeZone';
  static const String getLatLngZone = '/api/v1/config/detect-user-timezone';

}
