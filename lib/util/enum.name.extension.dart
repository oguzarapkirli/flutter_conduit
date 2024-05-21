extension EnumName on Enum {
  String get name => toString().split('.').last;
}
