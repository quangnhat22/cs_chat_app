import 'dart:math';

class AppConfig {
  // TODO: switch to [10.0.2.2] if using android emulator
  static const baseUrl = "192.168.0.20:8080/v1";

  // static const baseUrl = "192.168.1.5:8080/v1";
  static const httpScheme = 'http://$baseUrl';

  static const giphyKey = "NXZrld80m47Yyfq7x5tj5poNU85hvnb3";

  static Random random = Random();
}
