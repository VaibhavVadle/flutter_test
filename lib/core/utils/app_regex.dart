class AppRegex {
  static final RegExp email =
      RegExp(r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-\/=?^_`{|}~]+@[^\s@]+\.[a-zA-Z]+$");
  static final RegExp password =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
}
