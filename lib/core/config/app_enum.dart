// enum in app
enum AppGender {
  male("Male"),
  female("Female"),
  others("Other");

  const AppGender(this.value);

  final String value;

  static AppGender checkGenderEnum(String? value) {
    if (value == AppGender.male.value.toLowerCase()) {
      return AppGender.male;
    } else if (value == AppGender.female.value.toLowerCase()) {
      return AppGender.female;
    } else {
      return AppGender.others;
    }
  }
}

//theme in app
enum AppThemeEnum {
  light("Light"),
  dark("Dark"),
  system("System");

  const AppThemeEnum(this.value);

  final String value;
}

//language in app
enum AppLangEnum {
  en("English"),
  vi("Vietnamese"),
  system("System");

  const AppLangEnum(this.value);

  final String value;
}

//relation with other user
enum AppFriendRelation {
  self("self"),
  friend("friend"),
  received("received"),
  sent("sent"),
  blocked("blocked"),
  non("non");

  const AppFriendRelation(this.value);

  final String value;
}

//Media Resource
enum AppMediaResource {
  gallery("gallery"),
  camera("camera");

  const AppMediaResource(this.value);

  final String value;
}
