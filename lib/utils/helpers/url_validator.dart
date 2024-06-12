bool isValidURL(String url) {
  const urlPattern =
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$';
  final regExp = RegExp(urlPattern);
  return regExp.hasMatch(url);
}
