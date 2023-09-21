abstract class AppAPIEndpoints {
  static const baseUrl = 'https://ottapi.codestudios.in/api';
  static const sendOtpUrl = '$baseUrl/auth/send-otp';
  static const verifyOtpUrl = '$baseUrl/auth/verify-otp';
  static const resendOtpUrl = '$baseUrl/auth/resend-otp';
  static const createUserUrl = '$baseUrl/auth/create-user';
}
