enum CaptainRequestStatus {
  addCar,
  editCar,
  profile,
}

enum TripStatus {
  all,
  none,
  outOfZone,
  newTrip,
  assigned,
  on_the_way,
  arrived,
  started,
  completed,
  canceled
}

enum PaymentMethod {
  cash,
  wallet,
  visa,
  stcPay,
  applePay,
}

enum NotificationType { trip, notify, warning, block, coupon, wallet }

enum ChatUserType { user, captain }

enum TripType { live, scheduled }
enum LongDistanceTripType { passenger, betweenCities }
enum CountryType { SA, EG, FR }


// enum TripStatus {
//   none,
//   newTrip,
//   assigned,
//   on_the_way,
//   arrived,
//   started,
//   completed,
//   canceled
// }
