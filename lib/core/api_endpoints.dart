//all api endpoints

String baseUrl = 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1';

class ApiEndpoint{
  static String getEmailToken() {
    return '$baseUrl/auth/email';
  }
  static String verifyEmail() {
    return '$baseUrl/auth/email/verify';
  }
  static String register() {
    return '$baseUrl/auth/register';
  }
  static String login() {
    return '$baseUrl/auth/login';
  }

}