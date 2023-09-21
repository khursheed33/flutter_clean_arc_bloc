import '../enums/gender_type.dart';

class Constants {
  static const String dateFormat = "MM-dd-yyyy";
  static List<GenderType> get genders => [
        GenderType.male,
        GenderType.female,
        GenderType.other,
      ];

  static int get otpMaxLen => 6;
  static int get phoneMaxLen => 10;
}
