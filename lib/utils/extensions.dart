extension NotNullNotEmpty on String? {
  bool isNotNullNotEmpty() => (this != null && this!.isNotEmpty);
}
